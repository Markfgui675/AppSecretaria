import 'package:flutter/material.dart';

class Transparencia extends StatefulWidget {
  const Transparencia({Key? key}) : super(key: key);

  @override
  State<Transparencia> createState() => _TransparenciaState();
}

class _TransparenciaState extends State<Transparencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('Transparencia')
            ],
          ),
        )
    );
  }
}

