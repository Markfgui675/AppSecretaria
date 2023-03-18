import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CriarQuiz extends StatefulWidget {

  String tituloQuiz;
  CriarQuiz(this.tituloQuiz);


  @override
  State<CriarQuiz> createState() => _CriarQuizState();
}

class _CriarQuizState extends State<CriarQuiz> {

  TextEditingController _perguntaQuizController = TextEditingController();
  TextEditingController _q1QuizController = TextEditingController();
  TextEditingController _q2QuizController = TextEditingController();
  TextEditingController _q3QuizController = TextEditingController();
  TextEditingController _q4QuizController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  _captarDados(){

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.tituloQuiz,
                        style: GoogleFonts.kanit().copyWith(fontSize: 45, color: Colors.black)),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 150
                              ),
                              child: TextFormField(
                                controller: _perguntaQuizController,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Pergunta'
                                ),
                                validator: (value){
                                  if(value!.isNotEmpty){
                                    return null;
                                  } else {
                                    return 'Digite a pergunta';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 25,),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 75
                              ),
                              child: TextFormField(
                                controller: _q1QuizController,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Opção 1'
                                ),
                                validator: (value){
                                  if(value!.isNotEmpty){
                                    return null;
                                  } else {
                                    return 'Digite a opção 1';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 25,),

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 75
                              ),
                              child: TextFormField(
                                controller: _q2QuizController,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Opção 2'
                                ),
                                validator: (value){
                                  if(value!.isNotEmpty){
                                    return null;
                                  } else {
                                    return 'Digite a opção 2';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 25,),

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 75
                              ),
                              child: TextFormField(
                                controller: _q3QuizController,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Opção 3'
                                ),
                                validator: (value){
                                  if(value!.isNotEmpty){
                                    return null;
                                  } else {
                                    return 'Digite a opção 3';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 25,),

                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxHeight: 75
                              ),
                              child: TextFormField(
                                controller: _q4QuizController,
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Opção 4'
                                ),
                                validator: (value){
                                  if(value!.isNotEmpty){
                                    return null;
                                  } else {
                                    return 'Digite a opção 4';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  _captarDados();
                                }
                              },
                              child: Text('Salvar e Continuar')
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      )
    );
  }
}