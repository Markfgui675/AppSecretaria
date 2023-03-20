import 'package:app_secretaria_flutter/telas/configuracoes.dart';
import 'package:app_secretaria_flutter/telas/ita.dart';
import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/quizes.dart';
import 'package:app_secretaria_flutter/telas/inicio.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      const Quizes(),
      const Quem(),
      const Inicio(),
      const Ita(),
      const Configuracoes()
    ];

    return Scaffold(

      backgroundColor: Colors.white,


      body: Center(
        child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: telas[_indice]
        ),
      ),


      bottomNavigationBar: CurvedNavigationBar(
        height: 65.0,
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color(0xff2E6EA7),
        color: const Color(0xff2E6EA7),
        animationDuration: const Duration(milliseconds: 300),
        index: _indice,
        onTap: (indice){
          setState(() {
            _indice = indice;
          });
        },
        items: [
          Image.asset('icons/quiz.png', width: 32),
          Image.asset('icons/customer.png', width: 32),
          Image.asset('icons/home.png', width: 32),
          Image.asset('icons/ita_icone.png', width: 32),
          Image.asset('icons/setting.png', width: 32)
        ],

      ),

    );
  }
}
