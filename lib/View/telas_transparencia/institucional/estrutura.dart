import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Estrutura extends StatelessWidget {

  String texto1 = 'A estrutura administrativa da Secretaria '
      'de Estado de Saúde do Distrito Federal é composta por diversas unidades e setores institucionais.';

  String texto2 = 'Dentre os principais estão o Gabinete, a '
      'Secretaria Adjunta de Assistência à Saúde – SAS, a Secretaria Adjunta de Gestão à Saúde – SAG, '
      'o Secretário Adjunto Executivo de Saúde, a Assessoria Jurídico-Legislativa – AJL, '
      'a Controladoria Setorial da Saúde – CONT e a Diretoria Executiva do Fundo de Saúde do Distrito Federal – FSDF.';

  String texto3 = 'Também fazem parte da Estrutura Administrativa '
      'as Assessorias e Coordenações Especiais de Apoio ao Gabinete, as Subsecretarias, '
      'as Superintendências Regionais de Saúde, as Unidades de Referência Distrital em Saúde e os Órgãos Vinculados.';

  String texto4 = '''
 - Assessoria Especial (ASSESP)
 
 - Assessoria de Comunicação (ASCOM)
 
 - Assessoria de Gestão Estratégica e Projetos (AGEP)
 
 - Assessoria de Gestão Participativa e Relações Institucionais (ARINS)
 
 - Assessoria de Apoio à Documentação Administrativa (ASADM)
 
 - Coordenação Especial de Tecnologia de Informação em Saúde (CTINF)
 
 - Coordenação Especial de Gestão de Contratos de Serviços de Saúde (CGCSS)''';

  String texto5 = '''
 - Subsecretaria de Atenção Integral à Saúde (SAIS)
 
 - Subsecretaria de Administração Geral (SUAG)
 
 - Subsecretaria de Planejamento em Saúde (SUPLANS)
 
 - Subsecretaria de Infraestrutura em Saúde (SINFRA)
 
 - Subsecretaria de Logística em Saúde (SULOG)
 
 - Subsecretaria de Gestão de Pessoas (SUGEP)
 
 - Subsecretaria de Vigilância à Saúde (SVS)''';

  String texto6 = '''
 - Superintendência Central (SRSCE)
 
 - Superintendência Centro-Sul (SRSCS)
 
 - Superintendência Norte (SRSNO)
 
 - Superintendência Sul (SRSSU)
 
 - Superintendência Leste (SRSLE)
 
 - Superintendência Oeste (SRSOE)
 
 - Superintendência Sudoeste (SRSSO)''';

  String texto7 = '''
 - Complexo Regulador em Saúde do Distrito Federal;
 
 - Hospital de Apoio de Brasília – HAB;
 
 - Hospital Materno Infantil Dr. Antonio Lisboa – HMIB;
 
 - Hospital São Vicente de Paulo – HSVP;
 
 - Hospital da Criança de Brasília José Alencar – HCB;
 
 - Hospital de Base do Distrito Federal – HBDF;''';

  String texto8 = '''
 - Conselho de Saúde do Distrito Federal – CSDF;
 
 - Fundação Hemocentro de Brasília – FHB;
 
 - Fundação de Ensino e Pesquisa em Ciência da Saúde – FEPECS.''';

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
        'https://info.saude.df.gov.br/estruturaadministrativadasaude/'
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text('Estrutura Adm. da Saúde',
            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          )),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              Text('As Assessorias e Coordenações Especiais são:',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
              SizedBox(height: sizedBox,),
              Text(texto4,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),

              Text('São sete as Subsecretarias:',
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
              SizedBox(height: sizedBox,),
              Text(texto5,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),

              Text('São sete as Superintendências:',
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
              SizedBox(height: sizedBox,),
              Text(texto6,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),

              Text('As Unidades de Referência Distrital, URD’s, são:',
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
              SizedBox(height: sizedBox,),
              Text(texto7,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),

              Text('Os Órgãos Vinculados à SES/DF são:',
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
              SizedBox(height: sizedBox,),
              Text(texto8,
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

