import 'package:flutter/material.dart';

class QuemQuem extends StatefulWidget {
  const QuemQuem({Key? key}) : super(key: key);

  @override
  State<QuemQuem> createState() => _QuemQuemState();
}

class _QuemQuemState extends State<QuemQuem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Quem é quem"),
    );
  }
}

