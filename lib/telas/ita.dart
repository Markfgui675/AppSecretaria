import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ita extends StatefulWidget {
  const Ita({Key? key}) : super(key: key);

  @override
  State<Ita> createState() => _ItaState();
}

class _ItaState extends State<Ita> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('ITA'),
      ),
    );
  }
}
