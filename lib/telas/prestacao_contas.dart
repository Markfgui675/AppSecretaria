import 'package:flutter/material.dart';

class Prestacao extends StatefulWidget {
  const Prestacao({Key? key}) : super(key: key);

  @override
  State<Prestacao> createState() => _PrestacaoState();
}

class _PrestacaoState extends State<Prestacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Prestação de contas')
            ],
          ),
        ));
  }
}

