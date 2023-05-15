import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ServidoresPresta extends StatelessWidget {

  String texto1 = 'A consulta referente aos servidores públicos está disponível no Portal da Transparência '
      'do Distrito Federal, de maneira detalhada e também no aplicativo '
      'para dispositivos móveis, “Siga Brasília”, em linguagem de fácil compreensão e poderão ser acessados pelos seguintes'
      'endereços eletrônicos: ';

  String texto2 = 'Ainda, em atendimento à Lei n° 5.802, de 10 de janeiro de 2017, '
      'foram também disponibilizadas no Portal da Transparência do Distrito '
      'Federal consultas relativas aos cargos em comissão, aos de provimento '
      'efetivo ocupados e aos vagos em cada órgão ou entidade.';

  String texto3 = 'Outras informações referentes aos servidores da Secretaria de Saúde, estão disponíveis no  Portal '
      'da Secretaria de Saúde do Distrito Federal e poderão ser consultadas acessando o seguinte endereço eletrônico:';

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
        'http://www.transparencia.df.gov.br/#/servidores/remuneracao'
    );

    final Uri link2 = Uri.parse(
        'http://www.sigabrasilia.df.gov.br/'
    );

    final Uri link3 = Uri.parse(
        'http://www.transparencia.df.gov.br/#/servidores/cargo-comissionado'
    );

    final Uri link4 = Uri.parse(
        'http://www.transparencia.df.gov.br/#/servidores/cargo-efetivo'
    );

    final Uri link5 = Uri.parse(
        'https://www.saude.df.gov.br/servidores-nomeacoes-e-vacancias'
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text('Servidores',
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
                    child: const Text('Servidores - Remuneração')
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
                    child: const Text('Siga Brasília')
                ),
                SizedBox(height: sizedBox,),
                Text(texto2,
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
                    child: const Text('Cargos Comissionados')
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
                    child: const Text('Cargos Efetivos')
                ),
                SizedBox(height: sizedBox,),
                Text(texto3,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: sizedBox,),
                ElevatedButton(
                    onPressed: (){
                      _launched = _launchInBrowser(link5);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text('Servidores - Nomeações')
                ),

              ],
            ),
          ),
        )

    );
  }
}