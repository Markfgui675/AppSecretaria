import 'package:app_secretaria_flutter/quiz/criar_quiz.dart';
import 'package:flutter/material.dart';

class TituloQuiz extends StatefulWidget {
  const TituloQuiz({Key? key}) : super(key: key);

  @override
  State<TituloQuiz> createState() => _TituloQuizState();
}

class _TituloQuizState extends State<TituloQuiz> {

  TextEditingController _tituloQuiz = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: TextField(
                        controller: _tituloQuiz,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Titulo do Quiz', border: OutlineInputBorder()),
                      ),
                    ),
                    SizedBox(height: 25,),
                    ElevatedButton(
                        onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CriarQuiz(_tituloQuiz.text)));
                          },
                        child: Text('Salvar e continuar')
                    )
                  ],
                ),
              )
          ),
        )
    );
  }
}
