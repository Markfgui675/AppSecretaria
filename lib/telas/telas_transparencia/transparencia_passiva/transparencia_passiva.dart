import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TransparenciaPassiva extends StatelessWidget {

  String texto1 = 'A finalidade da Lei de Acesso à Informação é garantir o direito de acesso '
      'às informações públicas, previsto na Constituição Federal (inciso XXXIII do art. 5º).';

  String texto2 = 'Com a publicação da Lei Federal nº 12.527, de 2011, e da '
      'Lei Distrital nº 4.990, de 2012, o Distrito Federal fica obrigado a '
      'disponibilizar as informações sob sua guarda a qualquer pessoa '
      '(física ou jurídica) que as solicite, desde que não estejam protegidas por legislação de sigilo.';

  String texto3 = 'A Transparência Ativa é a divulgação de informações por '
      'iniciativa do próprio órgão público, sem que sequer tenham sido solicitadas, como, por exemplo, as informações '
      'que são disponibilizadas no site da Secretaria de Saúde e neste Portal da Transparência. ';

  String texto4 = 'Já a Transparência Passiva é a divulgação de informações '
      'após serem requeridas à Administração Pública, por meio dos sistemas Ouv-DF (Sistema de Ouvidoria) e o e-SIC DF (Sistema de Informação ao Cidadão eletrônico). '
      'Agora, esses dois sistemas estão reunidos em um único canal, o Participa DF. ';

  String texto5 = 'Acesse e saiba mais sobre o Participa-DF e '
      'as formas de entrar em contato com a Ouvidoria/SES/DF ou de solicitar acesso à informação.';

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
        'https://info.saude.df.gov.br/transparencia-passiva/'
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Transparência Passiva',
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
              Text(texto4,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto5,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),

            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff2ab11),
        foregroundColor: Colors.white,
        elevation: 6,
        child: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare, color: Color(0xff2E6EA7), size: 15,),
        onPressed: (){
          _launched = _launchInBrowser(link1);
        },
      ),

    );
  }
}