import 'dart:ui';

import 'package:app_secretaria_flutter/quiz/criar_quiz.dart';
import 'package:app_secretaria_flutter/quiz/responder_quiz.dart';
import 'package:app_secretaria_flutter/quiz/titulo_quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Quiz.dart';

class Quizes extends StatefulWidget {
  const Quizes({Key? key}) : super(key: key);

  @override
  State<Quizes> createState() => _QuizesState();
}

class _QuizesState extends State<Quizes> {

  final formKey = GlobalKey<FormState>();
  Quiz quiz = Quiz();
  bool ok = false;

  List<Quiz> listaQuiz = [];

  Future<List<Quiz>> _recuperarQuizes() async{
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection('quizes').getDocuments();

    for (DocumentSnapshot item in querySnapshot.documents){
      var dados = item.data;

      Quiz quiz = Quiz();
      quiz.idQuiz = item.documentID;
      quiz.titulo = dados['titulo'];

      listaQuiz.add(quiz);
    }

    return listaQuiz;
  }

  Future<void> _reloadList() async{
    var newList = await Future.delayed(Duration(seconds: 2),
        () => _recuperarQuizes()
    );
    listaQuiz.clear();
    setState(() {
      listaQuiz = newList;
    });
  }


  _mostraQuiz(){
    return FutureBuilder<List<Quiz>>(
        future: _recuperarQuizes(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    CircularProgressIndicator()
                  ],
                ),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              print('cheguei aqui');
              return SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: _reloadList,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index){

                        List<Quiz> listaQuizes = snapshot.data!;
                        Quiz quiz = listaQuizes[index];

                        return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ResponderQuiz()));
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 70,
                                  padding: EdgeInsets.all(16),
                                  margin: EdgeInsets.only(bottom: 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[200],
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 8.0,
                                            offset: Offset(0.9,0.1)
                                        )
                                      ]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(quiz.titulo,
                                          style: GoogleFonts.kanit().copyWith(fontSize: 18, color: Colors.black)
                                      )
                                    ],
                                  )
                              ),
                            )
                        );
                      }
                  ),
                ),
              );
              break;
          }
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TituloQuiz()));}, child: Text('Criar Quiz')),
              _mostraQuiz()
            ],
          ),
        ),
      ),
    );
  }
}


