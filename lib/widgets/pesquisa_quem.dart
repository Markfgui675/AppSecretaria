import 'package:flutter/material.dart';

class PesquisaQuem extends StatefulWidget {
  const PesquisaQuem({Key? key}) : super(key: key);

  @override
  State<PesquisaQuem> createState() => _PesquisaQuemState();
}

class _PesquisaQuemState extends State<PesquisaQuem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Pesquisa"),
    );
  }
}

