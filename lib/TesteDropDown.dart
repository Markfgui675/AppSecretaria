import 'package:flutter/material.dart';

class Drop extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Audi', 'BMW', 'Ferrari', 'Lamborghini', 'Tesla'];

  Drop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 180,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellow,

            ),
            child: ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _){
                  return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 3,
                    dropdownColor: Colors.grey,
                    isExpanded: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: const Text("Escolha a opção"),
                    value: (value.isEmpty) ? null : value,
                    items: dropOpcoes.map((opcao) => DropdownMenuItem(
                      child: Text(opcao),
                      value: opcao,
                    )).toList(),
                    onChanged: (escolha){
                      dropValue.value = escolha.toString();
                      print(dropValue.value);
                    }
                  );
                }
            ),
          )
        ),
      )
    );
  }
}

