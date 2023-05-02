import 'package:app_secretaria_flutter/Model/Usuario.dart';
import 'package:app_secretaria_flutter/telas/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home.dart';
import 'cadastro.dart';

class Entrada extends StatefulWidget {
  const Entrada({Key? key}) : super(key: key);

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {

  Usuario usuario = Usuario();

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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
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
                              children: <Widget>[
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
