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

  bool _selected = false;

  String _valueFiltro = '';

  final dropValueNome = ValueNotifier('');
  List<Servidor> dropOpcoesNome = [];

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
            Servidor servidor = Servidor();
            if(true){
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                dropOpcoesNome.add(servidor);
              });
            }

          }
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  Widget buttonFiltro({required String text, required Function() onTap}){
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 240,
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xfff2ab11)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: GoogleFonts.kanit()
                    .copyWith(
                    fontWeight:
                    FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black)
            ),
            const Icon(Icons.arrow_drop_down_outlined, color: Color(0xff2E6EA7),)
          ],
        ),
      ),
    );
  }

  Future modalSetorAssesoria(){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            )
        ),
        context: context,
        builder: (context){
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xff2E6EA7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Assessoria e Gabinete',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.keyboard_double_arrow_left_outlined, color: Color(0xfff2ab11), size: 42,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: () => modalSetorGabinete(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Gabinete',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined, size: 36, color: Color(0xfff2ab11),)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Secretaria-Adjunta de Assistência à Saúde - SAA');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text('Secretaria Adjunta de Assitência à Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Secretaria-Adjunta de Gestão em Saúde - SAG');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text('Secretaria Adjunta de Gestão em Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Assessoria Jurídico-Legislativa');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Assesoria Jurído - Legislativa',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Controladoria Setorial da Saúde - CONT');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Controladoria Setorial de Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Fundo de Saúde do Distrito Federal - FSDF');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Diretoria Executiva do Fundo de Saúde do Distrito Federal',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  Future modalSetorGabinete(){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            )
        ),
        context: context,
        builder: (context){
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xff2E6EA7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Gabinete',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.keyboard_double_arrow_left_outlined, color: Color(0xfff2ab11), size: 42,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.setSetor('Assessoria Especial – ASSESP');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Assessoria Especial',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Assessoria de Apoio à Documentação Administrativa – ASADM');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Assessoria de Apoio a Documentação Administrativa',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Assessoria de Gestão Participativa e Relações Institucionais – ARINS');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Assessoria de Gestão Participativa e Relações Institucionais',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Assessoria de Comunicação – ASCOM');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Assessoria de Comunicação',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Assessoria de Gestão Estratégica e Projetos – AGEP');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Assessoria de Gestão Estratégica e Projetos',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Coordenação Especial de Tecnologia de Informação em Saúde – CTINF');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Coordenação Especial de Tecnologia da Infomação em Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Coordenação Especial de Gestão de Contratos de Serviços de Saúde – CGCSS');
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Coordenação Especial de Gestão de Contratos e Serviços de Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  Future modalSetorSubsecretarias(){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            )
        ),
        context: context,
        builder: (context){
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xff2E6EA7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Subsecretarias',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.keyboard_double_arrow_left_outlined, color: Color(0xfff2ab11), size: 42,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Vigilância à Saúde - SVS');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subsecretaria de Vigilância a Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Atenção Integral à Saúde - SAIS');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subsecretaria de Atenção Integral à Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Infraestrutura em Saúde - SINFRA');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subsecretaria de Infraestrutura em Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Administração Geral - SUAG');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subsecretaria de Administração Geral',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Gestão de Pessoas - SUGEP');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subsecretaria de Gestão de Pessoas',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Logística em Saúde - SULOG');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Subsecretaria de Logística em Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Subsecretaria de Planejamento em Saúde - SUPLANS');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text('Subsecretaria de Planejamento em Saúde',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  Future modalSetorSuperintendencias(){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            )
        ),
        context: context,
        builder: (context){
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xff2E6EA7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Superintendências',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.keyboard_double_arrow_left_outlined, color: Color(0xfff2ab11), size: 42,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Central - SRSCE');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Superintendência da Região de Saúde Central',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Centro-Sul - SRSCS');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Superintendência da Região de Saúde Centro-Sul',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Oeste - SRSOE');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Superintendência da Região de Saúde Oeste',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Sul - SRSSU');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Superintendência da Região de Saúde Sul',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Sudoeste - SRSSO');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Superintendência da Região de Saúde Sudoeste',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Norte - SRSNO');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Superintendência da Região de Saúde Norte',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Superintendência da Região de Saúde Leste - SRSLE');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Text('Superintendência da Região de Saúde Leste',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  Future modalSetorUnidadereferenciais(){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            )
        ),
        context: context,
        builder: (context){
          return Container(
            decoration: const BoxDecoration(
                color: Color(0xff2E6EA7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                )
            ),
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Unidades de Referência',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.keyboard_double_arrow_left_outlined, color: Color(0xfff2ab11), size: 42,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){
                          controller.setSetor('Hospital de Apoio de Brasília - HAB');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hospital de Apoio de Brasília',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Hospital São Vicente de Paulo - HSVP');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hospital São Vicente de Paulo',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Hospital Materno Infantil Dr. Antonio Lisboa - HMIB');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Hospital Materno Infantil Dr. Antonio Lisboa',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.setSetor('Complexo Regulador em Saúde do Distrito Federal - CRDF');
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Complexo Regulador em Saúde do Distrito Federal',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      color: Colors.white)
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  Future modalNome(){
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30)
        )
      ),
        context: context,
        builder: (context){
          return Container(
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Nome',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.cancel_outlined, color: Color(0xff2E6EA7), size: 32,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView.builder(
                    itemCount: dropOpcoesNome.length,
                    itemBuilder: (_, index){

                      Servidor servidor = dropOpcoesNome[index];

                      return ListTile(
                        title: Text(servidor.nome,
                            style: GoogleFonts.kanit().copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black)
                        ),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ServidorScreen(servidor)))
                      );

                    }
                  ),
                ),

              ],
            ),
          );
        }
    );
  }

  //primeiros
  Future modalSetor(){
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)
            ),
        ),
        context: context,
        builder: (context){
          return Container(
            decoration: const BoxDecoration(
              color: Color(0xff2E6EA7),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              )
            ),
            padding: const EdgeInsets.all(22),
            height: 580,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Setor',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white)
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.cancel_outlined, color: Color(0xfff2ab11), size: 32,),
                    )
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: ListView(
                    children: [

                      InkWell(
                        onTap: () => modalSetorAssesoria(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Assessoria e Gabinete',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.white)
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined, color: Color(0xfff2ab11),size: 36,)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => modalSetorSubsecretarias(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subsecretarias',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.white)
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined, color: Color(0xfff2ab11),size: 36,)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => modalSetorSuperintendencias(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Superintendências',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.white)
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined, color: Color(0xfff2ab11),size: 36,)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => modalSetorUnidadereferenciais(),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Unidade de Referência Distrital',
                                  style: GoogleFonts.kanit().copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20,
                                      color: Colors.white)
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined, color: Color(0xfff2ab11),size: 36,)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          );
        }
    );
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
                      buttonFiltro(
                        onTap: () => modalSetor(),
                        text: 'Setor'
                      ),
                      const SizedBox(width: 5,),
                      buttonFiltro(
                          text: 'Nome',
                          onTap: () => modalNome()
                      )
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
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
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
