import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Quiz.dart';
import '../Model/Servidor.dart';
import '../quiz/quiz_options.dart';

class Quizes extends StatefulWidget {
  const Quizes({Key? key}) : super(key: key);

  @override
  State<Quizes> createState() => _QuizesState();
}

class _QuizesState extends State<Quizes> {

  List<Quiz> quizes = [];
  _recuperarQuiz() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('quiz').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');

            Quiz quiz = Quiz();

            quiz.id_quiz = docSnapshot.data()['id_quiz'];
            quiz.titulo = docSnapshot.data()['titulo'];
            quiz.info = docSnapshot.data()['info'];

            setState(() {
              quizes.add(quiz);
            });
          }
          print(quizes);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  @override
  void initState() {
    _recuperarQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*2,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: quizes.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemBuilder: (_, index){

                Quiz quiz = quizes[index];

                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return QuizOption(quiz);
                        })
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 120,
                    width: 280,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 0)
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(quiz.titulo,
                            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
