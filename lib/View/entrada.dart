import 'dart:math';

import 'package:app_secretaria_flutter/Model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_secretaria_flutter/Controller/auth_controller.dart';
import '../Home.dart';
import 'cadastro.dart';
import 'login.dart';

class Entrada extends StatefulWidget {
  const Entrada({Key? key}) : super(key: key);

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {

  Usuario usuario = Usuario();

  bool loading = false;

  AuthController authController = AuthController();

  _mensagemSnackBar(bool ok) {
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: Text('Login executado com sucesso!'),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: Text(
                'Não foi possível fazer o login. Verifique a sua conexão com a internet.'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
    }
  }

  _gerarNomeAleatorio(){
    List<String> letras = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
      'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
      's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    String nomeAleatorio = '';

    for(int l = 0; l < 6; l++){
      int r = Random().nextInt((letras.length - 1));
      nomeAleatorio = nomeAleatorio + letras[r];
    }

    print(nomeAleatorio);
    return nomeAleatorio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('imagens/hospital.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.2)
                  ]
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Transparência da Saúde',
                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastro()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff2E6EA7),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Cadastrar',
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              border: const Border(),
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xfff2ab11),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Entrar',
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff2E6EA7)),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){
                            FirebaseAuth auth = FirebaseAuth.instance;
                            FirebaseFirestore dbUsers = FirebaseFirestore.instance;
                            setState(() {
                              loading = true;
                            });
                            String nomeAleatorio = _gerarNomeAleatorio();
                            auth.signInAnonymously().then((firebaseUser){
                              User? user = firebaseUser.user;
                              dbUsers.collection('usuarios').doc(user!.uid).set(
                                  {
                                    'id':user.uid,
                                    'nome':nomeAleatorio,
                                    'email':'conta@anonima.com',
                                    'profilepic':''
                                  }
                              );
                              _mensagemSnackBar(true);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                            }).catchError((e){
                              _mensagemSnackBar(false);
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              border: const Border(),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: loading ? [
                                Center(
                                  child: CircularProgressIndicator(),
                                )
                              ] : [
                                Text('Entrar como convidado',
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff2E6EA7)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        );
  }
}
