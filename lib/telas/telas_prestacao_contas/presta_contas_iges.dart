import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PrestaIges extends StatelessWidget {

  String texto1 = 'Dashboard com as despesas declaradas do IGES:';

  double sizedBox = 25;

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  @override
  Widget build(BuildContext context) {

    final Uri link1 = Uri.parse(
        'https://info.saude.df.gov.br/despesasdeclaradasigesdf/'
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text('Prestação de Contas - IGES',
              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
            )),

        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[

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
                    child: const Text('Despesas - IGES')
                ),


              ],
            ),
          ),
        )

    );
  }
}

