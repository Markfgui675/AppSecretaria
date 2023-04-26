import 'package:app_secretaria_flutter/telas/configuracoes.dart';
import 'package:app_secretaria_flutter/telas/prestacao_contas.dart';
import 'package:app_secretaria_flutter/telas/quem.dart';
import 'package:app_secretaria_flutter/telas/quizes.dart';
import 'package:app_secretaria_flutter/telas/inicio.dart';
import 'package:app_secretaria_flutter/telas/transparencia.dart';
import 'package:app_secretaria_flutter/widgets/header_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var currentPage = DrawerSections.inicio;
  dynamic atualPage = 'Início';

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.inicio) {
      container = Inicio();
      atualPage = 'Início';
    } else if (currentPage == DrawerSections.quem) {
      container = Quem();
      atualPage = 'Quem é quem';
    } else if (currentPage == DrawerSections.prestacao_de_contas) {
      container = Prestacao();
      atualPage = 'Prestação de Contas';
    } else if (currentPage == DrawerSections.transparencia) {
      container = Transparencia();
      atualPage = 'Transparência';
    } else if (currentPage == DrawerSections.quizes) {
      container = Quizes();
      atualPage = 'Quizes';
    } else if (currentPage == DrawerSections.configuracoes) {
      container = Configuracoes();
      atualPage = 'Configurações';
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(atualPage,
            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          )),
      body: container,
      drawer: Drawer(
        backgroundColor: const Color(0xff2E6EA7),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Inicio", 'icons/home.png',
              currentPage == DrawerSections.inicio ? true : false),
          menuItem(2, "Quem é quem", 'icons/customer.png',
              currentPage == DrawerSections.quem ? true : false),
          menuItem(3, "Prestação de contas", 'icons/prestacao_contas.png',
              currentPage == DrawerSections.prestacao_de_contas ? true : false),
          menuItem(4, "Transparência", 'icons/transparencia.png',
              currentPage == DrawerSections.transparencia ? true : false),
          menuItem(5, "Quizes", 'icons/quiz.png',
              currentPage == DrawerSections.quizes ? true : false),
          const SizedBox(height: 280),
          menuItem(6, "Configurações", 'icons/setting.png',
              currentPage == DrawerSections.configuracoes ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, String urlIcon, bool selected) {
    return Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
      child: Material(
        color: selected ? const Color.fromRGBO(0, 10, 100, 0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.inicio;
              } else if (id == 2) {
                currentPage = DrawerSections.quem;
              } else if (id == 3) {
                currentPage = DrawerSections.prestacao_de_contas;
              } else if (id == 4) {
                currentPage = DrawerSections.transparencia;
              } else if (id == 5) {
                currentPage = DrawerSections.quizes;
              } else if (id == 6) {
                currentPage = DrawerSections.configuracoes;
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    urlIcon,
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  )
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: GoogleFonts.kanit().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: const Color(0xfff2ab11)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  inicio,
  quem,
  prestacao_de_contas,
  transparencia,
  quizes,
  configuracoes
}
