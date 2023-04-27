import 'package:app_secretaria_flutter/telas/telas_prestacao_contas/plano_plurianual.dart';
import 'package:app_secretaria_flutter/telas/telas_prestacao_contas/resultados_alcancados.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Prestacao extends StatefulWidget {
  const Prestacao({Key? key}) : super(key: key);

  @override
  State<Prestacao> createState() => _PrestacaoState();
}

class _PrestacaoState extends State<Prestacao> {

  double width_containers = 180;
  double height_containers = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              //Ações e programas
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Ações e Programas',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(10),
                        children: [
                          //PPA
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PlanoPluri()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(right: 20),
                              width: 180,
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
                                  Text('Plano Pluarianual - PPA',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),

                                ],
                              ),
                            ),
                          ),

                          //Resultados Alcançados
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultadosAlcancados()));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(right: 20),
                              width: 180,
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
                                  Text('Resultados Alcançados',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),

                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),

              //Auditorias
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Auditorias',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [
                            Container(
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
                                  Text('Teste',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),

                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //Convênios
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Convênios',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [
                            Container(
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
                                  Text('Teste',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //Licitações
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Licitações',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [
                            Container(
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
                                  Text('Teste',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //Contrato
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Contrato',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [
                            Container(
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
                                  Text('Teste',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //Despesas
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Despesas',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [
                            Container(
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
                                  Text('Teste',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

              //Servidores
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Servidores',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                    ),
                    const SizedBox(height: 5,),
                    SizedBox(
                        height: height_containers,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(10),
                          children: [
                            Container(
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
                                  Text('Teste',
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                  const SizedBox(height: 8,),
                                  Container(width: 180, height: 5, color: Colors.orange,),
                                  const SizedBox(height: 8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                      const SizedBox(width: 5,),
                                      Text('Teste',
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                    ],
                                  )

                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}

