import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/telas_transparencia/institucional/base_juridica.dart';
import 'package:app_secretaria_flutter/telas/telas_transparencia/institucional/competencias.dart';
import 'package:app_secretaria_flutter/telas/telas_transparencia/institucional/estrutura.dart';
import 'package:app_secretaria_flutter/telas/telas_transparencia/mais_transparencia/informacoes_classificadas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Transparencia extends StatefulWidget {
  const Transparencia({Key? key}) : super(key: key);

  @override
  State<Transparencia> createState() => _TransparenciaState();
}

class _TransparenciaState extends State<Transparencia> {

  String texto1 = 'Existem informações consideradas imprescindíveis à segurança da sociedade '
      'ou do Estado e, portanto, passíveis de classificação. Mesmo sendo públicas, o acesso a '
      'elas deve ser limitado por um tempo determinado. De acordo com o art. 26 da LAI Distrital tais informações '
      'podem ser classificadas como reservadas, secretas e ultrassecretas. Informamos que a Secretaria '
      'de Estado de Saúde do Distrito Federal não possui informações classificadas neste sentido.';

  String texto2 = 'Existem informações consideradas imprescindíveis à segurança da sociedade '
      'ou do Estado e, portanto, passíveis de classificação...';

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  double width_containers = 180;
  double height_containers = 150;

  double width_containers_2 = 280;
  double height_containers_2 = 220;

  @override
  Widget build(BuildContext context) {

    final Uri link1 = Uri.parse(
        'https://www.cg.df.gov.br/o-que-e-o-acesso-a-informacoes/'
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

              //LAI
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 220,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //LAI
                    Text('Conheça a Lei de Acesso à informação - LAI',
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                    const SizedBox(height: 8,),
                    Container(width: 180, height: 5, color: const Color(0xff2E6EA7),),
                    const SizedBox(height: 25,),
                    GestureDetector(
                      onTap: (){
                        _launched = _launchInBrowser(link1);
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          border: const Border(),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xfff2ab11),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Clique aqui',
                              style: GoogleFonts.kanit().copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xff2E6EA7)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Institucional
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Institucional',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [

                            //Estrutura
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Estrutura()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers,
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
                                      Text('Estrutura',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            ),

                            //Competências
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Competencias()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers,
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
                                      Text('Competências',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            ),

                            //Base jurídica
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BaseJuridica()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers,
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
                                      Text('Base Jurídica',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            ),

                            //Quem é quem
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Quem()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers,
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
                                      Text('Quem é quem',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //Mais sobre a transparência
              Container(
                margin: const EdgeInsets.only(top: 22),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Mais sobre a transparência',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers_2,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [

                            //Informações classificadas
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InformacoesClassificadas()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers_2,
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
                                      Text('Informações Classificadas',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),
                                      const SizedBox(height: 8,),
                                      Text(texto2,
                                        style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                                      ),
                                      const SizedBox(height: 8,),
                                      Text('Leia mais',
                                        style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xff2E6EA7)),
                                      ),

                                    ],
                                  ),
                                )
                            ),

                            //Perguntas Frequentes da SES
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InformacoesClassificadas()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers_2,
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
                                      Text('Perguntas Frequentes da SES/DF',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            ),

                            //Perguntas frequentes da LAI
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InformacoesClassificadas()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers_2,
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
                                      Text('Perguntas Frequentes da LAI',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            ),

                            //Serviço de Informação ao cidadão
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => InformacoesClassificadas()));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 20),
                                  width: width_containers_2,
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
                                      Text('Serviço de Informação ao Cidadão',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                      const SizedBox(height: 8,),
                                      Container(width: 180, height: 5, color: Colors.orange,),

                                    ],
                                  ),
                                )
                            ),

                          ],
                        )
                    )
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}

