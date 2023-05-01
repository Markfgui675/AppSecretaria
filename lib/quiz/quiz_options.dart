import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Quiz.dart';
import '../Model/Quiz.dart';

class QuizOption extends StatefulWidget {
  Quiz quiz;
  QuizOption(this.quiz, {super.key});

  @override
  State<QuizOption> createState() => _QuizOptionState();
}

class _QuizOptionState extends State<QuizOption> {

  List options = [];
  _recuperaOptions(List info){
    options.add(info);
  }

  @override
  void initState() {
    _recuperaOptions(widget.quiz.info);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(widget.quiz.titulo,
            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: widget.quiz.info.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 550,
                      width: MediaQuery.of(context).size.width,
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
                        children: [
                          Text(widget.quiz.info[index]['options'].toString(),
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          Text(widget.quiz.info[index]['question'].toString(),
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          SizedBox(
                            height: 200,
                            child: ListView.builder(
                              itemCount:widget.quiz.info[index]['options'].length,
                                itemBuilder: (_, index){
                                  return Container(
                                    color: Colors.red,
                                    child: Center(
                                      child: Text(widget.quiz.info[index]['options'].toString()),
                                    ),
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}


