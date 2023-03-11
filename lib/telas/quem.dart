import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quem extends StatefulWidget {
  const Quem({Key? key}) : super(key: key);

  @override
  State<Quem> createState() => _QuemState();
}

class _QuemState extends State<Quem> {
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
              Text('Quem')
            ],
          ),
        ),
      ),
    );
  }
}
