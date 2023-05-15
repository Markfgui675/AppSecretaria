import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PedidoInfo extends StatelessWidget {

  String texto1 = 'É uma solicitação de informações sobre ações, programas, despesas, contratos, servidores, '
      'entre outros temas previstos na Lei Distrital de Acesso à Informação nº 4.990/2012.';

  String texto2 = ' Antes de registrar seu pedido, visite o link Acesso à '
      'informação da SESDF ou acesse o Portal da Transparência.';

  String texto3 = 'Caso não encontre as informações procuradas, registre o seu Pedido.';

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


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Pedido de Informação',
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
            children: [

              Text(texto1,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto2,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto3,
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

            ],
          ),
        ),
      ),
    );
  }
}