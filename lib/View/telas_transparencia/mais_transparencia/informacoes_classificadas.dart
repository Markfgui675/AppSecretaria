import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InformacoesClassificadas extends StatelessWidget {

  String texto1 = 'Existem informações consideradas imprescindíveis à segurança da sociedade '
      'ou do Estado e, portanto, passíveis de classificação. Mesmo sendo públicas, o acesso a '
      'elas deve ser limitado por um tempo determinado. De acordo com o art. 26 da LAI Distrital tais informações '
      'podem ser classificadas como reservadas, secretas e ultrassecretas. Informamos que a Secretaria '
      'de Estado de Saúde do Distrito Federal não possui informações classificadas neste sentido.';

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
        'https://info.saude.df.gov.br/informacoesclassificadas/'
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Informações Classificadas',
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
              ElevatedButton(
                  onPressed: (){
                    _launched = _launchInBrowser(link1);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff2ab11),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  child: const Text('Saiba Mais')
              ),

            ],
          ),
        ),
      ),
    );
  }
}