import 'package:app_secretaria_flutter/widgets/quem_quem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';

import 'filtra_quem.dart';

class Quem extends StatefulWidget {
  bool veioPelaTransparencia;
  Quem(this.veioPelaTransparencia);

  @override
  State<Quem> createState() => _QuemState();
}

class _QuemState extends State<Quem> {

  Future<void>? _launched;

  Future<void> _launchInBrowser(Uri url) async {

    if(!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }

  }

  @override
  Widget build(BuildContext context) {

    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'info.saude.df.gov.br',
      path: '/quem/',
      fragment: '#'
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: widget.veioPelaTransparencia ? AppBar(
            backgroundColor: const Color(0xff2E6EA7),
            elevation: 0,
            centerTitle: true,
            title: Text('Quem é Quem',
              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
            )) :
        AppBar(backgroundColor: Colors.transparent, elevation: 0, toolbarHeight: 0),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [

                //corpo do quem é quem
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      QuemQuem()
                    ]
                  ),
                ),
              ],
            ),
          ),
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDialFabWidget(

          secondaryIconsList: const [
            Icons.filter_alt_rounded,
            Icons.link,
          ],
          secondaryIconsText: const [
            "Pesquisa com Filtros",
            "Info Saúde"
          ],
          secondaryIconsOnPress: [
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => FiltraQuem())),
                () => _launched = _launchInBrowser(toLaunch)
          ],
          secondaryBackgroundColor: const Color(0xff2E6EA7),
          secondaryForegroundColor: Colors.white,
          primaryBackgroundColor: const Color(0xfff2ab11),
          primaryForegroundColor: const Color(0xff2E6EA7),

        )


    );
  }
}
