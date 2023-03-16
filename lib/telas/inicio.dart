import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/quizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'configuracoes.dart';
import 'ita.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Boas vindas
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Seja bem-vindo!',
                      style: GoogleFonts.kanit().copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text('Img')
                  ],
                ),
              ),

              //Texto o que é transparência
              Container(
                width: double.infinity,
                height: 280,
                padding: EdgeInsets.all(16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 12.0,
                        offset: Offset(0.9,0.1)
                      )
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('O que é transparência da saúde?',
                        style: GoogleFonts.kanit().copyWith(fontSize: 18, color: Colors.black),),
                      SizedBox(height: 5,),
                      Container(width: 60, height: 4, color: Color(0xfff2ab11),) //linha
                    ],
                  ),
                )
              ),
              SizedBox(height: 20,),



              //Pratique os seus conhecimentos sobre a transparência na saúde
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Pratique os seus conhecimentos sobre a transparência da saúde',
                      style: GoogleFonts.kanit().copyWith(fontSize: 20, color: Colors.black),),
                    SizedBox(height: 5,),
                    Container(width: 120, height: 4, color: Color(0xff2E6EA7),),
                    SizedBox(height: 25,),
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                            child: ElevatedButton(
                              onPressed: (){

                              },
                              child: Text('Quizes'),
                              style: ElevatedButton.styleFrom(
                                  elevation: 2.0,
                                  backgroundColor: Color(0xfff2ab11)
                              ),
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              )



              //ita

              //quem é quem
            ],
          ),
        ));
  }
}
