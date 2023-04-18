import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final dropValueSetor = ValueNotifier('');
final dropOpcoesSetor = ['Audi', 'BMW', 'Ferrari', 'Lamborghini', 'Tesla'];

final dropValueTelefone = ValueNotifier('');
final dropOpcoesTelefone = ['Audi', 'BMW', 'Ferrari', 'Lamborghini', 'Tesla'];

final dropValueEndereco = ValueNotifier('');
final dropOpcoesEndereco = ['Audi', 'BMW', 'Ferrari', 'Lamborghini', 'Tesla'];

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

Widget filtroTelefone() {
  return SizedBox(
      width: 150,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xfff2ab11),
        ),
        child: ValueListenableBuilder(
            valueListenable: dropValueTelefone,
            builder: (BuildContext context, String value, _) {
              return DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  elevation: 3,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  hint: const Text("Telefone"),
                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 15, color: const Color(0xff2E6EA7)),
                  value: (value.isEmpty) ? null : value,
                  items: dropOpcoesTelefone
                      .map((opcao) => DropdownMenuItem(
                    value: opcao,
                    child: Text(opcao),
                  ))
                      .toList(),
                  onChanged: (escolha) {
                    dropValueTelefone.value = escolha.toString();
                    print(dropValueTelefone.value);
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
