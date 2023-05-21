import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PesquisaSemResultado extends StatelessWidget {
  const PesquisaSemResultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text('Sem resultados para esses filtros.',
        style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
    );
  }
}

