import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                            controller: _q1QuizController,
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
                            controller: _q1QuizController,
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
                            controller: _q1QuizController,
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
                              //Salvar Quiz
                              Navigator.pop(context);
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

  _salvarQuiz(){

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
