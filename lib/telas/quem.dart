import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
                color: Colors.red,
                padding: EdgeInsets.all(12),
                child:
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                      ],
                )
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){},
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
                    )
                  ],
                ),
              )





            ],
          ),
        ),
      ),




      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
        decoration: BoxDecoration(
          border: Border(),
          borderRadius: BorderRadius.circular(20),
          color: Color(0xfff2ab11),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(10,10),
              blurRadius: 15
            )
          ]
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: (){
                    setState(() {
                      _launched = _launchInBrowser(toLaunch);
                    });
                  },
                  child: Text(
                    'Saiba Mais',
                    style: GoogleFonts.kanit().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xff2E6EA7)),
                  )
              )
            ],
                ),
        ),
      );
  }
}
