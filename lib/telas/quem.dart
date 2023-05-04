import 'package:app_secretaria_flutter/widgets/pesquisa_quem.dart';
import 'package:app_secretaria_flutter/widgets/quem_quem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:exists_in/exists_in.dart';

class Quem extends StatefulWidget {
  const Quem({Key? key}) : super(key: key);

  @override
  State<Quem> createState() => _QuemState();
}

class _QuemState extends State<Quem> {

  final dropValueNome = ValueNotifier('');
  final dropOpcoesNome = [''];

  final dropValueSetor = ValueNotifier('');
  final dropOpcoesSetor = [''];

  final dropValueEndereco = ValueNotifier('');
  final dropOpcoesEndereco = [''];

  recuperaDados() async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    dropOpcoesNome.clear();
    dropOpcoesSetor.clear();
    dropOpcoesEndereco.clear();
    int i = 0;
    bool c = true;
    await db.collection('qq_pesquisa').get().then(
            (querySnapshot){
          for (var docSnapshot in querySnapshot.docs){
            //print('${docSnapshot.data()}');
            if(true){
              setState(() {
                dropOpcoesNome.add(docSnapshot.data()['nome']);
              });
            }
            if(true){
              setState(() {
                dropOpcoesSetor.add(docSnapshot.data()['setor']);
              });
            }
            if(c){
              setState(() {
                dropOpcoesEndereco.add(docSnapshot.data()['endereco']);
                c = !c;
              });
            }
            if(existsIn(docSnapshot.data()['endereco'], dropOpcoesEndereco)){
              //elemento existe na lista, portanto, não adiciona
            } else {
              setState(() {
                dropOpcoesEndereco.add(docSnapshot.data()['endereco']);
              });
            }


          }
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }


  Widget filtroNome() {
    return SizedBox(
        width: 240,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueNome,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Nome"),
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                    value: (value.isEmpty) ? null : value,
                    items: dropOpcoesNome
                        .map((opcao) => DropdownMenuItem(
                      value: opcao,
                      child: Text(opcao),
                    ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueNome.value = escolha.toString();
                      print(dropValueNome.value);
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
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueSetor,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Setor"),
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                    value: (value.isEmpty) ? null : value,
                    items: dropOpcoesSetor
                        .map((opcao) => DropdownMenuItem(
                      value: opcao,
                      child: Text(opcao),
                    ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueSetor.value = escolha.toString();
                      print(dropValueSetor.value);
                    });
              }),
        ));
  }

  Widget filtroEndereco() {
    return SizedBox(
        width: 330,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueEndereco,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Endereço"),
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                    value: (value.isEmpty) ? null : value,
                    items: dropOpcoesEndereco
                        .map((opcao) => DropdownMenuItem(
                      value: opcao,
                      child: Text(opcao)
                    ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueEndereco.value = escolha.toString();
                      print(dropValueEndereco.value);
                    });
              }),
        ));
  }







  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  bool telaCorpo = true;
  //pesquisa_quem = false
  //quem_quem = true

  @override
  void initState() {
    recuperaDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'info.saude.df.gov.br',
      path: '/quem/',
      fragment: '#'
    );

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [

                  //Filtros e botão de pesquisar
                  Container(
                      width: double.infinity,
                      height: 90,
                      padding: const EdgeInsets.all(12),
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          filtroNome(),
                          const SizedBox(width: 5,),
                          filtroSetor(),
                          const SizedBox(width: 5,),
                          filtroEndereco(),
                        ],
                      )
                  ),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 12,left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Botão pesquisar
                        ElevatedButton(
                            onPressed: (){
                              print(dropValueNome.value.toString());
                              print(dropValueEndereco.value.toString());
                              print(dropValueSetor.value.toString());
                              setState(() {
                                telaCorpo = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:  Color(0xff2E6EA7),
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.search),
                                      const SizedBox(width: 5,),
                                      Text('Pesquisar',
                                        style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ),
                        const SizedBox(width: 15,),
                        //Botão remover filtros
                        ElevatedButton(
                            onPressed: (){
                              setState(() {
                                telaCorpo = true;
                              });
                              dropValueNome.value = '';
                              dropValueSetor.value = '';
                              dropValueEndereco.value = '';
                              recuperaDados();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xfff2ab11),
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.cancel_outlined, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Remover filtros',
                                        style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: const Color(0xff2E6EA7)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),


                  //corpo do quem é quem
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: telaCorpo == false ? [
                        PesquisaQuem(dropValueNome.value.toString(), dropValueSetor.value.toString(), dropValueEndereco.value.toString())
                      ] : [
                        QuemQuem()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xfff2ab11),
            foregroundColor: Colors.white,
            elevation: 6,
            child: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare, color: Color(0xff2E6EA7), size: 15,),
            onPressed: (){
              _launched = _launchInBrowser(toLaunch);
            },
          ),


        )
    );
  }
}
