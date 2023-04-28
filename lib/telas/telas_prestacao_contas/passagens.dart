import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Passagens extends StatelessWidget {
  String texto1 =
      'Informamos que este órgão não possui despesas com passagens para servidores até o presente momento.';

  double sizedBox = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor:
            const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Passagens',
              style: GoogleFonts.kanit().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
            )),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[

                Text(texto1,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                ),


              ],
            ),
          ),
        ));
  }
}