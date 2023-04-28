import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Licitacoes extends StatelessWidget {

  String texto1 = 'As informações referente às licitações da Secretaria de Estado '
      'de Saúde estão disponíveis no Portal da Saúde de maneira detalhada e poderão ser acessadas pelos endereços:';

  String texto2 = 'Pregão:';

  String texto3 = 'Atas de Regsitro de Preço:';

  String texto4 = 'Dispensa de Licitação:';

  String texto5 = 'Inexigibilidade: ';

  String texto6 = 'O cidadão ainda pode consultar o tema pelos seguintes endereços eletrônicos:';

  String texto7 = '''
    COMPRASNET (informar o código UASG: 926119)

      Pregões

      Licitações

      Regime Diferenciado de Contratação''';

  String texto8 = 'E-COMPRAS';

  String texto9 = 'Concluídas:';

  String texto10 = 'Em andamento:';

  String texto11 = 'PORTAL DA TRANSPARÊNCIA DO DISTRITO FEDERAL';

  String texto12 = 'Licitações: ';

  String texto13 = 'Despesas por Item:';

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  double sizedBox = 25;
  double sizedBoxWidth = 10;

  @override
  Widget build(BuildContext context) {

    final Uri link1 = Uri.parse(
        'https://www.saude.df.gov.br/pregao/'
    );

    final Uri link2 = Uri.parse(
        'https://www.saude.df.gov.br/atas-de-registro-de-precos'
    );

    final Uri link3 = Uri.parse(
        'https://www.saude.df.gov.br/dispensa-de-licitacao/'
    );

    final Uri link4 = Uri.parse(
        'https://www.saude.df.gov.br/inexigibilidade-de-licitacao'
    );

    final Uri link5 = Uri.parse(
        'http://paineldecompras.economia.gov.br/'
    );

    final Uri link6 = Uri.parse(
        'https://www.compras.df.gov.br/publico/concluidas.asp'
    );

    final Uri link7 = Uri.parse(
        'https://www.compras.df.gov.br/publico/em_andamento.asp'
    );

    final Uri link8 = Uri.parse(
        'http://www.transparencia.df.gov.br/#/licitacoes-contratos/licitacoes'
    );

    final Uri link9 = Uri.parse(
        'http://www.transparencia.df.gov.br/#/licitacoes-contratos/itens-licitados'
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text('Licitações',
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

                Row(
                  children: [
                    Text(texto2,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Pregão')
                    ),

                  ],
                ),
                Row(
                  children: [
                    Text(texto3,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link2);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Atas')
                    ),

                  ],
                ),
                Row(
                  children: [
                    Text(texto4,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link3);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Dispensa de Licitação')
                    ),

                  ],
                ),
                Row(
                  children: [
                    Text(texto5,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link4);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Inexigibilidade')
                    ),

                  ],
                ),
                SizedBox(height: sizedBox,),

                Text(texto6,
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: sizedBox,),
                Text(texto7,
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
                    child: const Text('Painel de Compras')
                ),
                SizedBox(height: sizedBox,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(texto8,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: sizedBox,),
                Row(
                  children: [
                    Text(texto9,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link6);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Concluidas')
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(texto10,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link7);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Em andamento')
                    ),
                  ],
                ),
                SizedBox(height: sizedBox,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(texto11,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: sizedBox,),
                Row(
                  children: [
                    Text(texto12,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link8);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Licitações')
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(texto13,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(width: sizedBoxWidth,),
                    ElevatedButton(
                        onPressed: (){
                          _launched = _launchInBrowser(link9);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Despesas por item')
                    ),
                  ],
                ),


              ],
            ),
          ),
        )

    );
  }
}