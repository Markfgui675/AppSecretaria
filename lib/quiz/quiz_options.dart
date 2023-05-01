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

  List<dynamic> info_options = [];
  List<int> length_options = [];
  int length = 0;
  // 0 - question
  // 1 - answer_index
  // 2 - options
  // 3 - lenght_options
  _recuperaOptions(List info){

    for(int i = 0; i < info.length; i++){
      print('_recuperaOptions');
      print(info);

      for(var l in info[i]['options']){
        length++;
        setState(() {
          length_options = length;
        });
        length = 0;
      }

      setState(() {
        info_options.add([
          info[i]['question'],
          info[i]['answer_index'],
          info[i]['options'],
          length_options
        ]);
      });
      print('info options: $info_options');
    }

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
                      height: 350,
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
                          Text(info_options[index][0],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              itemCount: info_options[3],
                              itemBuilder: (_, index_2){
                                return Container(
                                  child: Column(
                                    children: [
                                      Text(info_options[index][2][index_2],
                                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                                    ],
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


