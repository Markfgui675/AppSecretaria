import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuemQuem extends StatelessWidget {
  const QuemQuem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Secretária de Saúde',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Gabinete',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Secretarias Adjuntas',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Assessoria Jurídico-Legislativa',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Diretoria Executiva do Fundo de Saúde do Distrito Federal',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Controladoria Setorial da Saúde',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Subsecretarias',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Superintendências',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Unidades de Referência Distrital ',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Órgãos Vinculados',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: Offset(0, 0)
                            )
                          ]
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),

      ],
    );
  }
}
