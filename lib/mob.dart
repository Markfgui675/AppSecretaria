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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_){
                  return Text('');
                },
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome'
                    ),
                    onChanged: controller.changeName,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Sobrenome'
                    ),
                    onChanged: controller.changeLastname,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Observer(
                    builder: (_){
                      return Text('${controller.nomecompleto}');
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}