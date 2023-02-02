import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quem extends StatefulWidget {
  const Quem({Key? key}) : super(key: key);

  @override
  State<Quem> createState() => _QuemState();
}

class _QuemState extends State<Quem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Quem'),
      ),
    );
  }
}
