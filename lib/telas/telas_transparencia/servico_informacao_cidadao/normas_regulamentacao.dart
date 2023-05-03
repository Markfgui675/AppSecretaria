import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NormasRegulamentacoes extends StatelessWidget {

  String texto1 = 'Leis';

  String texto2 = '''
  - Lei de Acesso à informação – Distrital (Lei nº 4.990/2012)

  - Lei de Acesso à informação – Federal (Lei Federal nº 12.527/2011)''';

  String texto3 = 'Decretos';

  String texto4 = '''
  - Procedimentos para credenciamento de segurança da Informação (Decreto nº 35.382/2014)

  - Regulamenta a Lei de Acesso à Informação no âmbito distrital (Decreto nº 34.276/2013)

  - Credenciamento de segurança e tratamento de informação (Decreto nº 7.845/2012)''';

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url,
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  double sizedBox = 25;

  @override
  Widget build(BuildContext context) {

    final Uri link1 = Uri.parse(
        'http://www.fazenda.df.gov.br/aplicacoes/legislacao/legislacao/TelaSaidaDocumento.cfm?txtNumero=4990&txtAno=2012&txtTipo=5&txtParte=.'
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Normas e Regulamentações',
            style: GoogleFonts.kanit().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white),
          )
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(texto1,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto2,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto3,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto4,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),

            ],
          ),
        ),
      ),
    );
  }
}