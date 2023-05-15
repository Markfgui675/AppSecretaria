import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CanaisAtendimento extends StatelessWidget {

  String texto1 = 'Para registrar um pedido de informação';

  String texto2 = ' Antes de registrar seu pedido de informação, '
      'busque a informação no link do Acesso à informação da SESDF ou acesse o Portal de Transparência.';

  String texto3 = 'Via internet';

  String texto4 = 'Caso não encontre o que procura, '
      'faça um pedido de informação por meio do ParticipaDF. Os temas e tipos de informação '
      'que podem ser solicitadas constam no artigo 7º da Lei Distrital de Acesso à informação nº 4.990/2012.';

  String texto5 = 'Presencial';

  String texto6 = 'Segunda a sexta-feira ';

  String texto7 = 'Das 9h às 12h e das 14h às 17h';

  String texto8 = 'SRTVN 701 Lote D, 1º andar, Ed. PO700';

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
        'https://www.saude.df.gov.br'
    );

    final Uri link2 = Uri.parse(
        'https://www.transparencia.df.gov.br/#/'
    );

    final Uri link3 = Uri.parse(
        'https://www.participa.df.gov.br'
    );

    final Uri link4 = Uri.parse(
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
            'Canais de atendimento',
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
              ElevatedButton(
                  onPressed: (){
                    _launched = _launchInBrowser(link1);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff2ab11),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: const Text('Acesso à informação SESDF')
              ),
              SizedBox(height: sizedBox,),
              ElevatedButton(
                  onPressed: (){
                    _launched = _launchInBrowser(link2);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff2ab11),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: const Text('Portal da Transparência')
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
              ElevatedButton(
                  onPressed: (){
                    _launched = _launchInBrowser(link3);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff2ab11),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: const Text('ParticipaDF')
              ),
              SizedBox(height: sizedBox,),
              ElevatedButton(
                  onPressed: (){
                    _launched = _launchInBrowser(link4);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff2ab11),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: const Text('Lei Distrital')
              ),
              SizedBox(height: sizedBox,),
              Text(texto5,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.calendar
                  ),
                  const SizedBox(width: 12,),
                  Text(texto6,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: sizedBox,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(
                      FontAwesomeIcons.calendar
                  ),
                  const SizedBox(width: 12,),
                  Text(texto7,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: sizedBox,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(
                      FontAwesomeIcons.calendar
                  ),
                  const SizedBox(width: 12,),
                  Text(texto8,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}