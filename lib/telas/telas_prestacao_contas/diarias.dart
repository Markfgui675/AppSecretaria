import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Diarias extends StatelessWidget {
  String texto1 =
      'Informamos que este órgão, no período dos últimos cinco anos, não realizou despesas com '
      'diárias para o ano de 2021. E para o ano de 2023, não há informações até o presente momento.';

  String texto2 = 'DIÁRIAS – DETALHES DAS VIAGENS À SERVIÇO';


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
        'https://info.saude.df.gov.br/wp-content/uploads/2023/01/Relatorio_87696545_DIARIAS_2022__ate_maio_.pdf'
    );

    final Uri link2 = Uri.parse(
        'https://info.saude.df.gov.br/wp-content/uploads/2023/01/Relatorio_87696545_DIARIAS_2022__ate_maio_.pdf'
    );

    final Uri link3 = Uri.parse(
        'https://info.saude.df.gov.br/wp-content/uploads/2023/01/Relatorio_87696545_DIARIAS_2022__ate_maio_.pdf'
    );

    final Uri link4 = Uri.parse(
        'https://info.saude.df.gov.br/wp-content/uploads/2023/01/Relatorio_87696545_DIARIAS_2022__ate_maio_.pdf'
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor:
            const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Diárias',
              style: GoogleFonts.kanit().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
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
                Text(texto2,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
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
                    child: const Text('Demonstrativo de Despesas com diárias de 2022')
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
                    child: const Text('Demonstrativo de Despesas com diárias de 2020')
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
                    child: const Text('Demonstrativo de Despesas com diárias de 2019')
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
                    child: const Text('Demonstrativo de Despesas com diárias de 2018')
                ),

              ],
            ),
          ),
        ));
  }
}