import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 12, left: 12),
      color: Color(0xff2E6EA7),
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('NomeUsario',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
              ),
              Text('Email@usario',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey[200]),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('imagens/secretaria_teste.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

