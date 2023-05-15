import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultadosAlcancados extends StatelessWidget {

  String texto1 = 'Os Resultados alcançados pela Secretaria de Estado '
      'de Saúde estão disponíveis no Portal da Saúde de maneira detalhada e poderão ser acessados pelo seguinte endereço:';

  String texto2 = 'O cidadão ainda pode consultar o tema, de maneira detalhada, pelos seguintes endereços eletrônicos:';

  String texto3 = 'Relatório de Atividades Quadrimestrais – RAQ';

  String texto4 = 'Sistema de Acompanhamento Governamental – SAG';

  String texto5 = 'Acordo de Gestão Local – AGL';

  String texto6 = 'Acordo de Gestão Regionalizada – AGR';

  String texto7 = 'Relatório Anual de Atividades';

  String texto8 = 'Relatório Anual de Gestão (RAG)';

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  double sizedBox = 25;

  @override
  Widget build(BuildContext context) {

    final Uri link1 = Uri.parse(
        'https://www.saude.df.gov.br/relatorios'
    );

    final Uri link2 = Uri.parse(
        'https://www.saude.df.gov.br/raq'
    );

    final Uri link3 = Uri.parse(
        'https://www.saude.df.gov.br/sag'
    );

    final Uri link4 = Uri.parse(
        'https://www.saude.df.gov.br/agl'
    );

    final Uri link5 = Uri.parse(
        'https://www.saude.df.gov.br/agr'
    );

    final Uri link6 = Uri.parse(
        'https://www.saude.df.gov.br/relatorio-anual-de-atividades'
    );

    final Uri link7 = Uri.parse(
        'https://www.saude.df.gov.br/relatorio-anual-de-gestao-rag'
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text('Resultados Alcançados',
              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
            )),

        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: const Text('Plano Plurianual - 2020 - 2023')
                ),
                SizedBox(height: sizedBox,),
                Text(texto2,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: sizedBox,),
                Text(texto3,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
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
                    child: const Text('RAQ')
                ),
                SizedBox(height: sizedBox,),
                Text(texto4,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                ElevatedButton(
                    onPressed: (){
                      _launched = _launchInBrowser(link3);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text('SAG')
                ),
                SizedBox(height: sizedBox,),
                Text(texto5,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                ElevatedButton(
                    onPressed: (){
                      _launched = _launchInBrowser(link4);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text('AGL')
                ),
                SizedBox(height: sizedBox,),
                Text(texto6,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                ElevatedButton(
                    onPressed: (){
                      _launched = _launchInBrowser(link5);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text('AGR')
                ),
                SizedBox(height: sizedBox,),
                Text(texto7,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                ElevatedButton(
                    onPressed: (){
                      _launched = _launchInBrowser(link6);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text('Relatório Anual de Atividades')
                ),
                SizedBox(height: sizedBox,),
                Text(texto8,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                ),
                ElevatedButton(
                    onPressed: (){
                      _launched = _launchInBrowser(link7);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text('RAG')
                ),

              ],
            ),
          ),
        )

    );
  }
}