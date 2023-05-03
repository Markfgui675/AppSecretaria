import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Sic extends StatelessWidget {

  String texto1 = 'As Ouvidorias do Governo do Distrito Federal também atuam como Serviço de Informações ao Cidadão – SIC.';

  String texto2 = 'Com a publicação da Lei de Acesso à Informação Distrital nº 4.990/2012, '
      'você passa a ter o direito de registrar um Pedido '
      'de Informação sobre ações, programas, despesas, contratos, servidores, entre outros temas previstos na lei.';

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
            'O que é o SIC?',
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
              ElevatedButton(
                  onPressed: (){
                    _launched = _launchInBrowser(link1);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff2ab11),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: const Text('LAI')
              ),

            ],
          ),
        ),
      ),
    );
  }
}

