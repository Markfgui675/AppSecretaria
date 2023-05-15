import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ResponsavelSic extends StatelessWidget {

  String texto1 = 'SRTVN Quadra 701 Lote D, 2º andar, Ed. PO700';

  String texto2 = 'Manhã – 8h às 12h / Tarde – 14h às 18h';

  String texto3 = 'Thyerys Araruna Almeida';

  String texto4 = '(61) 2017-1145 Ramais: 1028/1031';

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
        'https://info.saude.df.gov.br/sic/'
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Responsável pelo SIC (Ouvidor)',
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

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(FontAwesomeIcons.locationDot),
                  const SizedBox(width: 12,),
                  Text(texto1,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: sizedBox,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(FontAwesomeIcons.clock),
                  const SizedBox(width: 12,),
                  Text(texto2,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: sizedBox,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(FontAwesomeIcons.person),
                  const SizedBox(width: 12,),
                  Text(texto3,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: sizedBox,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(FontAwesomeIcons.phone),
                  const SizedBox(width: 12,),
                  Text(texto4,
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
                  ),
                ],
              ),

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

    ));
  }
}