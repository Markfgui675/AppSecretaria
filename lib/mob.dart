import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'Controller/mobx.dart';

class Mob extends StatefulWidget {
  const Mob({Key? key}) : super(key: key);

  @override
  State<Mob> createState() => _MobState();
}

class _MobState extends State<Mob> {

  //int _contador = 0;

  Controller controller = Controller();

  _textField({String? labelText, onChanged, required String Function() errorText}){

    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText()
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

              Observer(
                  builder: (_){
                    return _textField(
                      labelText: 'name',
                      onChanged: controller.cliente.changeName,
                      errorText: controller.validateName
                    );
                  }
              )

          ],
        ),
      ),
    );
  }
}