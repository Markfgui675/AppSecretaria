import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltraQuem extends StatefulWidget {
  const FiltraQuem({Key? key}) : super(key: key);

  @override
  State<FiltraQuem> createState() =>
      _FiltraQuemState();
}

class _FiltraQuemState extends State<FiltraQuem> {
  final dropValueNome = ValueNotifier('');
  final dropOpcoesNome = [''];

  final dropValueSetor = ValueNotifier('');
  final dropOpcoesSetor = [''];

  final dropValueEndereco = ValueNotifier('');
  final dropOpcoesEndereco = [''];

  Widget filtroNome() {
    return SizedBox(
        width: 240,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueNome,
              builder: (BuildContext context,
                  String value, _) {
                return DropdownButtonFormField<
                        String>(
                    borderRadius:
                        BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration:
                        const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Nome"),
                    style: GoogleFonts.kanit()
                        .copyWith(
                            fontWeight:
                                FontWeight.normal,
                            fontSize: 15,
                            color: const Color(
                                0xff2E6EA7)),
                    value: (value.isEmpty)
                        ? null
                        : value,
                    items: dropOpcoesNome
                        .map((opcao) =>
                            DropdownMenuItem(
                              value: opcao,
                              child: Text(opcao),
                            ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueNome.value =
                          escolha.toString();
                    });
              }),
        ));
  }

  Widget filtroSetor() {
    return SizedBox(
        width: 240,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueSetor,
              builder: (BuildContext context,
                  String value, _) {
                return DropdownButtonFormField<
                        String>(
                    borderRadius:
                        BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration:
                        const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Setor"),
                    style: GoogleFonts.kanit()
                        .copyWith(
                            fontWeight:
                                FontWeight.normal,
                            fontSize: 15,
                            color: const Color(
                                0xff2E6EA7)),
                    value: (value.isEmpty)
                        ? null
                        : value,
                    items: dropOpcoesSetor
                        .map((opcao) =>
                            DropdownMenuItem(
                              value: opcao,
                              child: Text(opcao),
                            ))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueSetor.value =
                          escolha.toString();
                    });
              }),
        ));
  }

  Widget filtroEndereco() {
    return SizedBox(
        width: 330,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(20),
            color: const Color(0xfff2ab11),
          ),
          child: ValueListenableBuilder(
              valueListenable: dropValueEndereco,
              builder: (BuildContext context,
                  String value, _) {
                return DropdownButtonFormField<
                        String>(
                    borderRadius:
                        BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    decoration:
                        const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Endereço"),
                    style: GoogleFonts.kanit()
                        .copyWith(
                            fontWeight:
                                FontWeight.normal,
                            fontSize: 15,
                            color: const Color(
                                0xff2E6EA7)),
                    value: (value.isEmpty)
                        ? null
                        : value,
                    items: dropOpcoesEndereco
                        .map((opcao) =>
                            DropdownMenuItem(
                                value: opcao,
                                child:
                                    Text(opcao)))
                        .toList(),
                    onChanged: (escolha) {
                      dropValueEndereco.value =
                          escolha.toString();
                    });
              }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Filtrar Quem é Quem',
            style: GoogleFonts.kanit().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff2E6EA7),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 90,
                  padding:
                      const EdgeInsets.all(12),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      filtroNome(),
                      const SizedBox(width: 5,),
                      filtroSetor(),
                      const SizedBox(width: 5,),
                      filtroEndereco(),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
