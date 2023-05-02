import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Auditorias extends StatelessWidget {

  String texto1 = 'As informações referentes a Auditorias internas e externas '
      'realizadas pelo Governo do Distrito Federal, como relatórios referentes '
      'às auditorias de contas anuais, auditorias especiais e inspeções estão disponibilizadas no '
      'Sítio Oficial da Controladoria-Geral do Distrito Federal e poderão ser '
      'consultadas acessando o seguinte endereço eletrônico';

  String texto2 = 'O cidadão ainda pode consultar o tema pelos seguintes endereços eletrônicos:';

  String texto3 = 'PORTAL DA TRANSPARÊNCIA - DF';

  String texto4 = 'TRIBUNAL DE CONTAS DO DISTRITO FEDERAL – TCDF';

  String texto5 = 'PORTAL DA CONTROLADORIA GERAL DA UNIÃO – CGU';

  String texto6 = 'PORTAL DO TRIBUNAL DE CONTAS DA UNIÃO – TCU';

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
        'https://www.cg.df.gov.br/'
    );

    final Uri link2 = Uri.parse(
        'http://www.transparencia.df.gov.br/'
    );

    final Uri link3 = Uri.parse(
        'https://www2.tc.df.gov.br/controle-externo/relatorios-de-auditorias-2/saude/'
    );

    final Uri link4 = Uri.parse(
        'https://eaud.cgu.gov.br/relatorios/?'
    );

    final Uri link5 = Uri.parse(
        'https://portal.tcu.gov.br/publicacoes-institucionais/lista/?tipo=3'
    );

    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text('Auditorias',
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
                    child: const Text('CG - DF')
                ),
                SizedBox(height: sizedBox,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                          _launched = _launchInBrowser(link2);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff2ab11),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: const Text('Portal da Transparência - DF')
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
                        child: const Text('Tribunal de Contas')
                    ),
                    SizedBox(height: sizedBox,),
                    Text(texto5,
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
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
                        child: const Text('Controladoria Geral da União')
                    ),
                    SizedBox(height: sizedBox,),
                    Text(texto6,
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
                        child: const Text('Tribunal de Contas da União')
                    ),
                  ],
                )


              ],
            ),
          ),
        )

    );
  }
}