import 'package:app_secretaria_flutter/telas/configuracoes.dart';
import 'package:app_secretaria_flutter/telas/ita.dart';
import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/quizes.dart';
import 'package:app_secretaria_flutter/telas/inicio.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indice = 2;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Quizes(),
      Quem(),
      Inicio(),
      Ita(),
      Configuracoes()
    ];

    return Scaffold(

      backgroundColor: Colors.white,


      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: telas[_indice]
        ),
      ),




      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blue,
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 300),
        index: _indice,
        onTap: (indice){
          setState(() {
            _indice = indice;
          });
        },
        items: [
          Icon(Icons.quiz, color: Colors.white, size: 32),
          Icon(Icons.people, color: Colors.white, size: 32),
          Icon(Icons.home, color: Colors.white, size: 32),
          Icon(Icons.cabin, color: Colors.white, size: 32),
          Icon(Icons.settings, color: Colors.white, size: 32)
        ],

      ),

    );
  }
}
