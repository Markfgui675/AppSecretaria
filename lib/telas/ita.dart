import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ita extends StatefulWidget {
  const Ita({Key? key}) : super(key: key);

  @override
  State<Ita> createState() => _ItaState();
}

class _ItaState extends State<Ita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Inicio')
            ],
          ),
        ),
      ),
    );
  }
}
