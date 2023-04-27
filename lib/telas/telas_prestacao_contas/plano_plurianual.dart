import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanoPluri extends StatelessWidget {

  String texto1 = 'O principal instrumento de planejamento orçamentário de médio prazo do Governo Federal '
      'é o Plano Plurianual – PPA. Ele define as diretrizes, os objetivos e as metas da administração '
      'pública federal, contemplando as despesas de capital (como, por exemplo, os investimentos) '
      'e outras delas decorrentes, além daquelas relativas aos programas de duração continuada '
      'para um período de quatro anos. Por meio dele, o governo desenvolve programas que levam '
      'benefícios à população.';

  String texto2 = 'Para uniformizar a publicação '
      'dos dados sobre o PPA do Governo do Distrito Federal '
      'a Secretaria de Estado de Economia – SEEC disponibilizou '
      'em seu sítio oficial o PPA 2020-2023, com todos seus documentos anexos, '
      'divididos por Unidade Orçamentária, os objetivos específicos, '
      'metas, indicadores e ações não orçamentárias. '
      'O PPA 2020-2023 pode ser acessado pelo link abaixo para extração das informações pertinentes '
      'a cada órgão/entidade do Distrito Federal:';

  String texto3 = 'Além disso, o cidadão pode ter acesso a todos os Planos Plurianuais '
      'do Governo do Distrito Federal por meio do link:';

  String texto4 = 'Para que o cidadão entenda como encontrar a Saúde nos Planos '
      'Plurianuais do Governo do Distrito Federal é preciso entender que as '
      'informações referentes à execução orçamentária e financeira comparada aos recursos previstos no PPA buscam demonstrar '
      'diversos recortes que permitam visualizar o desempenho do Plano por Esfera, Eixo Temático, Tipo de Programa, entre outros. ';

  String texto5 = 'Neste conjunto de informações, constam os valores do PPA e da '
      'Lei Orçamentária Anual –  LOA por programa, agrupados pelo Eixo Temático ao '
      'qual estão vinculados no Plano Estratégico 2019-2060, incluídos os recursos dos Orçamentos Fiscal, '
      'da Seguridade Social-OFSS, de Investimento das Estatais – OI e do Fundo Constitucional do DF- FCDF. ';

  String texto6 = 'Os recursos do FCDF previstos no PPA constam nos Programas Temáticos e de Gestão, Manutenção e Serviços '
      'ao Estado nas áreas de educação, saúde e segurança. ';

  String texto7 = '''Assim, considerando o Eixo Temático SAÚDE, a fim de permitir uma visão geral consolidada os programas são:  

    6202 – SAÚDE EM AÇÃO

    8202 – SAÚDE – GESTÃO E MANUTENÇÃO

    – SAÚDE – FUNDO CONSTITUCIONAL (*)''';

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
        'https://www.seplad.df.gov.br/plano-plurianual-2020-2023/'
    );

    final Uri link2 = Uri.parse(
        'https://www.economia.df.gov.br/plano-plurianual/'
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text('Plano Plurianual - PPA',
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
                  child: const Text('Plano Plurianual - 2020 - 2023')
              ),
              SizedBox(height: sizedBox,),
              Text(texto3,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
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
                  child: const Text('Plano Plurianual')
              ),
              SizedBox(height: sizedBox,),
              Text(texto4,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto5,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto6,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto7,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),

            ],
          ),
        ),
      )

    );
  }
}


