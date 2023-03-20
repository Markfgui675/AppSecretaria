import 'package:app_secretaria_flutter/auth_service.dart';
import 'package:app_secretaria_flutter/telas/entrada.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  irParaTelaLogin() async {
    if(AuthService().googleTf()){
      AuthService().signOut();
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Entrada()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Configurações'),
              SizedBox(height: 25,),
              GestureDetector(
                onTap: (){
                  irParaTelaLogin();
                },
                child: Icon(Icons.door_sliding_outlined, size: 50,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
