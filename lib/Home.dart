import 'package:app_secretaria_flutter/telas/configuracoes.dart';
import 'package:app_secretaria_flutter/telas/ita.dart';
import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/quizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indice = 0;

  List<Widget> telas = [
    Quem(),
    Quizes(),
    Ita(),
    Configuracoes()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Teste'),
        centerTitle: true,

      ),


      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              telas[_indice]
            ],
          ),
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
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        ],
      ),

    );
  }
}
