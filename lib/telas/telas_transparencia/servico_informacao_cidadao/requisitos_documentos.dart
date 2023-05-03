import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class RequisitosDocumentos extends StatelessWidget {

  String texto1 = 'O pedido de informação deverá conter:';

  String texto2 = '''
   - Nome do requerente
   
   - Apresentação de documento de identificação válido(Carteira de identidade, Cadastro de Pessoas Físicas – CPF, CadastroNacional de Pessoas Jurídicas – CNPJ, Título de Eleitor, Passaporte, Carteira de Trabalho, Carteira Funcional, Carteira de Habilitação (modelo novo) e Certificado de Reservista)
   
   - Especificação, de forma clara e precisa, da informação requerida
   
   - Endereço físico ou eletrônico do requerente, para recebimento de comunicações ou da informação requerida
  ''';

  String texto3 = 'Não será atendido Pedido de Informação genérico, desproporcional, desarrazoado, '
      'que exija trabalho adicional de análise, interpretação, consolidação de dados e '
      'informações, serviço de produção ou tratamento de dados que não seja de competência do órgão ou entidade.';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Requisitos e Documentos',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(texto1,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto2,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto3,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),

            ],
          ),
        ),
      ),
    );
  }
}