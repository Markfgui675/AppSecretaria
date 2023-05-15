import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/Servidor.dart';

class ServidorScreen extends StatefulWidget {
  Servidor servidor;
  ServidorScreen(this.servidor, {super.key});

  @override
  State<ServidorScreen> createState() => _ServidorScreenState();
}

class _ServidorScreenState extends State<ServidorScreen> {

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  @override
  Widget build(BuildContext context) {

    final Uri toLaunch = Uri(
        scheme: 'https',
        host: 'info.saude.df.gov.br',
        path: '/quem/',
        fragment: '#'
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text('Servidor',
            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          )),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.servidor.nome,
              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
            const SizedBox(height: 10,),
            Text(widget.servidor.setor,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black)),
            const SizedBox(height: 10,),
            Text(widget.servidor.telefone,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.black)),
            const SizedBox(height: 10,),
            Text(widget.servidor.endereco,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black)),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff2ab11),
        foregroundColor: Colors.white,
        elevation: 6,
        child: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare, color: Color(0xff2E6EA7), size: 15,),
        onPressed: (){
          _launched = _launchInBrowser(toLaunch);
        },
      ),
    );
  }
}


