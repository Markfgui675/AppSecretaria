import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final dropValueNome = ValueNotifier('');
final dropOpcoesNome = ['Lucilene Queiroz'];

final dropValueSetor = ValueNotifier('');
final dropOpcoesSetor = ['Secretaria de Saúde'];

final dropValueEndereco = ValueNotifier('');
final dropOpcoesEndereco = ['PO 700'];

Widget filtroNome() {
  return SizedBox(
      width: 150,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xfff2ab11),
        ),
        child: ValueListenableBuilder(
            valueListenable: dropValueNome,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 3,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: const Text("Nome"),
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                  value: (value.isEmpty) ? null : value,
                  items: dropOpcoesNome
                      .map((opcao) => DropdownMenuItem(
                    value: opcao,
                    child: Text(opcao),
                  ))
                      .toList(),
                  onChanged: (escolha) {
                    dropValueNome.value = escolha.toString();
                    print(dropValueNome.value);
                  });
            }),
      ));
}

Widget filtroSetor() {
  return SizedBox(
      width: 150,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xfff2ab11),
        ),
        child: ValueListenableBuilder(
            valueListenable: dropValueSetor,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 3,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: const Text("Setor"),
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                  value: (value.isEmpty) ? null : value,
                  items: dropOpcoesSetor
                      .map((opcao) => DropdownMenuItem(
                    value: opcao,
                    child: Text(opcao),
                  ))
                      .toList(),
                  onChanged: (escolha) {
                    dropValueSetor.value = escolha.toString();
                    print(dropValueSetor.value);
                  });
            }),
      ));
}

Widget filtroEndereco() {
  return SizedBox(
      width: 150,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xfff2ab11),
        ),
        child: ValueListenableBuilder(
            valueListenable: dropValueEndereco,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 3,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: const Text("Endereço"),
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                  value: (value.isEmpty) ? null : value,
                  items: dropOpcoesEndereco
                      .map((opcao) => DropdownMenuItem(
                    value: opcao,
                    child: Text(opcao),
                  ))
                      .toList(),
                  onChanged: (escolha) {
                    dropValueEndereco.value = escolha.toString();
                    print(dropValueEndereco.value);
                  });
            }),
      ));
}
