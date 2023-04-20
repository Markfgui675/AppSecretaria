import 'package:flutter/material.dart';

import '../Model/Servidor.dart';

class ServidorScreen extends StatefulWidget {
  Servidor servidor;
  ServidorScreen(this.servidor);

  @override
  State<ServidorScreen> createState() => _ServidorScreenState();
}

class _ServidorScreenState extends State<ServidorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.servidor.nome)
        ],
      ),
    );
  }
}


