import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quem extends StatefulWidget {
  const Quem({Key? key}) : super(key: key);

  @override
  State<Quem> createState() => _QuemState();
}

class _QuemState extends State<Quem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [

              //Filtros e botão de pesquisar
              Container(
                width: double.infinity,
                height: 90,
                color: Colors.red,
                padding: EdgeInsets.all(12),
                child:
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                        Container(
                          child: Text('Filtro', style: TextStyle(fontSize: 48),),
                        ),
                      ],
                )
              ),
              Container(
                width: double.infinity,
                color: Colors.yellow,
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        onPressed: (){},
                        child: Text('Pesquisar')
                    )
                  ],
                ),
              )





            ],
          ),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: Text(
            'Saiba mais',
            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff2E6EA7)),
          ),
          elevation: 5,
          backgroundColor: const Color(0xfff2ab11),
      ),
    );
  }
}
