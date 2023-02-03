import 'package:app_secretaria_flutter/telas/configuracoes.dart';
import 'package:app_secretaria_flutter/telas/ita.dart';
import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/quizes.dart';
import 'package:app_secretaria_flutter/telas/inicio.dart';
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



      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: telas[_indice]
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        onTap: (indice){
          setState(() {
            _indice = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Quizes'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Quem'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: 'Ita'),
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: 'Configurções'),
        ],
      ),

    );
  }
}
