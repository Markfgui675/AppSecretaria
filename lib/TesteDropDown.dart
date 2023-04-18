import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Audi', 'BMW', 'Ferrari', 'Lamborghini', 'Tesla'];

  Drop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (BuildContext context, String value, _){
            return DropdownButton<String>(
                hint: const Text("Escolha a opção"),
                value: (value.isEmpty) ? null : value,
                items: dropOpcoes.map((opcao) => DropdownMenuItem(
                    child: Text(opcao),
                    value: opcao,
                  )
                ).toList(),
                onChanged: (escolha) => dropValue.value = escolha.toString()
            );
          }
        ),
      )
    );
  }
}

