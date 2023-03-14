import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Seja bem-vindo!',
                      style: GoogleFonts.kanit().copyWith(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              //Texto o que é transparência
              Container(
                width: double.infinity,
                height: 280,
                padding: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('O que é transparência?', style: GoogleFonts.kanit().copyWith(fontSize: 18, color: Colors.black),),
                      SizedBox(height: 5,),
                      Container(width: 60, height: 4, color: Colors.orange,) //linha
                    ],
                  ),
                )
              )

              //Pratique os seus conhecimentos sobre a transparência na saúde

              //ita

              //quem é quem
            ],
          ),
        ));
  }
}
