import 'package:app_secretaria_flutter/widgets/pesquisa_quem.dart';
import 'package:app_secretaria_flutter/widgets/quem_quem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_secretaria_flutter/widgets/filtros_quem.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Quem extends StatefulWidget {
  const Quem({Key? key}) : super(key: key);

  @override
  State<Quem> createState() => _QuemState();
}

class _QuemState extends State<Quem> {

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  bool _status = true;
  bool telaCorpo = true;
  //pesquisa_quem = false
  //quem_quem = true

  _pesquisar(){}


  @override
  Widget build(BuildContext context) {

    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'info.saude.df.gov.br',
      path: '/quem/',
      fragment: '#'
    );

    return Scaffold(
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
                        filtroSetor(),
                        const SizedBox(width: 5,),
                        filtroTelefone(),
                        const SizedBox(width: 5,),
                        filtroEndereco(),
                      ],
                )
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 12,left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){
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
                                  Icon(Icons.search),
                                  SizedBox(width: 5,),
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
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            telaCorpo = true;
                          });
                          dropValueSetor.value = '';
                          dropValueTelefone.value = '';
                          dropValueEndereco.value = '';
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
                      PesquisaQuem()
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


      );
  }
}
