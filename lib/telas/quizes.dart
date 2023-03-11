import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Quiz.dart';

class Quizes extends StatefulWidget {
  const Quizes({Key? key}) : super(key: key);

  @override
  State<Quizes> createState() => _QuizesState();
}

class _QuizesState extends State<Quizes> {

  TextEditingController _tituloQuizController = TextEditingController();
  TextEditingController _perguntaQuizController = TextEditingController();
  TextEditingController _q1QuizController = TextEditingController();
  TextEditingController _q2QuizController = TextEditingController();
  TextEditingController _q3QuizController = TextEditingController();
  TextEditingController _q4QuizController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Quiz quiz = Quiz();
  bool ok = false;




  _exibirTelaCriarQuiz(){

    showDialog(
        context: context,
        builder: (context){
          return SingleChildScrollView(
            child: AlertDialog(
                title: Text('Criar Quiz'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: _tituloQuizController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Titulo do Quiz'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Informe o título do Quiz';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _perguntaQuizController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Pergunta do Quiz'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Informe a pergunta do Quiz';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _q1QuizController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Primeira opção'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Informe a opção';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _q2QuizController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Segunda opção'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Informe a opção';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _q3QuizController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Terceira opção'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Informe a opção';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _q4QuizController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Quarta opção'
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value){
                              if (value!.isEmpty){
                                return 'Informe a opção';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: (){

                              if(formKey.currentState!.validate()){
                                quiz.titulo = _tituloQuizController.text;
                                quiz.pergunta = _perguntaQuizController.text;
                                quiz.q1 = _q1QuizController.text;
                                quiz.q2 = _q2QuizController.text;
                                quiz.q3 = _q3QuizController.text;
                                quiz.q4 = _q4QuizController.text;
                                _salvarQuiz(quiz);
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Salvar')
                        ),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('Cancelar')
                        ),
                      ],
                    )
                  ],
                )
            ),
          );
        }
    );
  }

  _salvarQuiz(Quiz quiz){

    Firestore db = Firestore.instance;

    db.collection('quizes')
    .document(_tituloQuizController.text)
    .setData(quiz.toMap()).
    then((value){
      ok = true;
      _mensagemSnackBar(ok);
    }).catchError((error){
      ok = false;
      print('erro:'+error.toString());
      _mensagemSnackBar(ok);
    });

    _tituloQuizController.text = '';
    _perguntaQuizController.text = '';
    _q1QuizController.text = '';
    _q2QuizController.text = '';
    _q3QuizController.text = '';
    _q4QuizController.text = '';

  }

  _mensagemSnackBar(bool ok){

    if(ok){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: Text('Quiz criado com sucesso!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: Text('Não foi possível criar o Quiz'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
    }

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
              ElevatedButton(
                  onPressed: _exibirTelaCriarQuiz,
                  child: Text('Criar Quiz')
              )
            ],
          ),
        ),
      ),
    );
  }
}
