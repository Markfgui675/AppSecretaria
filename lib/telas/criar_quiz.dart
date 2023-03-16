import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CriarQuiz extends StatefulWidget {
  const CriarQuiz({Key? key}) : super(key: key);

  @override
  State<CriarQuiz> createState() => _CriarQuizState();
}

class _CriarQuizState extends State<CriarQuiz> {

  TextEditingController _tituloQuizController = TextEditingController();
  TextEditingController _perguntaQuizController = TextEditingController();
  TextEditingController _q1QuizController = TextEditingController();
  TextEditingController _q2QuizController = TextEditingController();
  TextEditingController _q3QuizController = TextEditingController();
  TextEditingController _q4QuizController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
            height: MediaQuery.of(context).size.height,
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
                      Text('Criar Quiz',
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
                            TextFormField(
                              controller: _tituloQuizController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Titulo'
                              ),
                            ),
                            SizedBox(height: 25,),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 150
                              ),
                              child: TextFormField(
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Pergunta'
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              controller: _q1QuizController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Opção 1'
                              ),
                            ),
                            SizedBox(height: 25,),

                            TextFormField(
                              controller: _q2QuizController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Opção 2'
                              ),
                            ),
                            SizedBox(height: 25,),

                            TextFormField(
                              controller: _q3QuizController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Opção 3'
                              ),
                            ),
                            SizedBox(height: 25,),

                            TextFormField(
                              controller: _q4QuizController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Opção 4'
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
                              onPressed: (){},
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