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



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Quiz'),
    );
  }
}




