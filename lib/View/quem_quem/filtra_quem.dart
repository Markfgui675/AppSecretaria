import 'package:app_secretaria_flutter/widgets/pesquisa_semResultado.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exists_in/exists_in.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../Controller/mobx.dart';
import '../../Model/Servidor.dart';
import '../servidor.dart';

class FiltraQuem extends StatefulWidget {
  const FiltraQuem({Key? key}) : super(key: key);

  @override
  State<FiltraQuem> createState() =>
      _FiltraQuemState();
}

class _FiltraQuemState extends State<FiltraQuem> {

  Mobx controller = Mobx();

  final dropValueNome = ValueNotifier('');
  final dropOpcoesNome = [''];

  final dropValueSetor = ValueNotifier('');
  final dropOpcoesSetor = [''];

  recuperaDados() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    dropOpcoesNome.clear();
    dropOpcoesSetor.clear();

    //Recuperação dos nomes
    await db.collection('qq_pesquisa').orderBy("nome", descending: false).get().then(
            (querySnapshot){
          for (var docSnapshot in querySnapshot.docs){
            //print('${docSnapshot.data()}');
            if(true){
              setState(() {
                dropOpcoesNome.add(docSnapshot.data()['nome']);
              });
            }

          }
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

    // Recuperação dos setores
    await db.collection('qq_pesquisa').orderBy("setor", descending: false).get().then(
            (querySnapshot){
          for(var docSnapshot in querySnapshot.docs){
            if(true){
              setState(() {
                dropOpcoesSetor.add(docSnapshot.data()['setor']);
              });
            }
          }
        }
    );

  }

  Widget filtroNome() {
    return SizedBox(
        width: 240,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueNome,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                    borderRadius:
                        BorderRadius.circular(20),
                    elevation: 3,
                    menuMaxHeight: 500.0,
                    iconEnabledColor: const Color(0xff2E6EA7),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration:
                        const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Nome"),
                    style: GoogleFonts.kanit()
                        .copyWith(
                            fontWeight:
                                FontWeight.normal,
                            fontSize: 15,
                            color: const Color(
                                0xff2E6EA7)),
                    value: (value.isEmpty)
                        ? null
                        : value,
                    items: dropOpcoesNome
                        .map((opcao) =>
                            DropdownMenuItem(
                              value: opcao,
                              child: Text(opcao),
                            ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueNome.value = escolha.toString();
                      controller.setNome(dropValueNome.value.toString());
                    });
              }),
        ));
  }

  Widget filtroSetor() {
    return SizedBox(
        width: 240,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueSetor,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                    borderRadius:
                        BorderRadius.circular(20),
                    elevation: 3,
                    menuMaxHeight: 500.0,
                    iconEnabledColor: const Color(0xff2E6EA7),
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration:
                        const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Setor"),
                    style: GoogleFonts.kanit()
                        .copyWith(
                            fontWeight:
                                FontWeight.normal,
                            fontSize: 15,
                            color: const Color(0xff2E6EA7)),
                    value: (value.isEmpty)
                        ? null
                        : value,
                    items: dropOpcoesSetor
                        .map((opcao) =>
                            DropdownMenuItem(
                              value: opcao,
                              child: Text(opcao),
                            ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueSetor.value = escolha.toString();
                      controller.setSetor(dropValueSetor.value.toString());
                    });
              }),
        ));
  }

  void initState() {
    controller.recuperarServidorFiltrados('', '');
    recuperaDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Filtrar Quem é Quem',
            style: GoogleFonts.kanit().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff2E6EA7),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 90,
                  padding:
                      const EdgeInsets.all(12),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      filtroSetor(),
                      const SizedBox(width: 5,),
                      filtroNome(),
                    ],
                  )),
              const SizedBox(height: 4,),

              //Botão remover filtros
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: ElevatedButton(
                    onPressed: (){
                      dropValueNome.value = '';
                      dropValueSetor.value = '';
                      controller.setLimparFiltro();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2E6EA7),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        fixedSize: Size(180, 50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.cancel_outlined, color: Color(0xfff2ab11),),
                              const SizedBox(width: 5,),
                              Text('Remover filtros',
                                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: const Color(0xfff2ab11)),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                ),

              ),
              const SizedBox(height: 24,),

              // Resultado da pesquisa
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.75,
                    width: double.infinity,
                    child: Observer(
                      builder: (_){
                        return Observer(
                            builder: (_){
                              if(controller.listaFiltrada.length == 0){
                                return PesquisaSemResultado();
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.listaFiltrada.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(10),
                                  itemBuilder: (_, index){

                                    Servidor servidor = controller.listaFiltrada[index];
                                    print('$servidor no index $index');

                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServidorScreen(servidor)));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(bottom: 20),
                                        height: 120,
                                        width: 280,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey.withOpacity(0.2),
                                                  blurRadius: 12,
                                                  offset: const Offset(0, 0)
                                              )
                                            ]
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(servidor.nome,
                                                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            }
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
