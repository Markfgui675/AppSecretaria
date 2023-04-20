import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuemQuem extends StatefulWidget {
  const QuemQuem({Key? key}) : super(key: key);

  @override
  State<QuemQuem> createState() => _QuemQuemState();
}

class _QuemQuemState extends State<QuemQuem> {

  List secretaria = [];
  List gabinete = [];
  List secretarias_adjuntas = [];
  List assessoria_juridico_lesgislativa = [];
  List diretoria_executiva = [];
  List controladoria_setorial = [];
  List subsecretarias = [];
  List superintendencias = [];
  List unidades_referencia = [];
  List orgaos_vinculados = [];

  _recuperaSecretaria() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('secretaria').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            secretaria = servidores1;
          });
          print(secretaria);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaGabinete() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('gabinete').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            gabinete = servidores1;
          });
          print(gabinete);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaSecretariaAdjuntas() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('secretarias_adjuntas').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            secretarias_adjuntas = servidores1;
          });
          print(secretarias_adjuntas);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaAssesorias() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('assessoria_juridico_lesgislativa').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            assessoria_juridico_lesgislativa = servidores1;
          });
          print(assessoria_juridico_lesgislativa);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaDiretoriaExecutiva() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('diretoria_executiva').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            diretoria_executiva = servidores1;
          });
          print(diretoria_executiva);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaControladoria() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('controladoria_setorial').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            controladoria_setorial = servidores1;
          });
          print(controladoria_setorial);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaSubsecretarias() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('subsecretarias').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            subsecretarias = servidores1;
          });
          print(subsecretarias);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaSuperintendencias() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('superintendencias').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            superintendencias = servidores1;
          });
          print(superintendencias);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaUnidadesReferenciais() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('unidades_referencia').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            unidades_referencia = servidores1;
          });
          print(unidades_referencia);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaOrgaosVinculados() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('orgaos_vinculados').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          //print(servidores1);
          setState(() {
            orgaos_vinculados = servidores1;
          });
          print(orgaos_vinculados);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  _recuperarServidores(){

    _recuperaSecretaria();
    _recuperaGabinete();
    _recuperaSecretariaAdjuntas();
    _recuperaAssesorias();
    _recuperaDiretoriaExecutiva();
    _recuperaControladoria();
    _recuperaSubsecretarias();
    _recuperaSuperintendencias();
    _recuperaUnidadesReferenciais();
    _recuperaOrgaosVinculados();

  }

  @override
  void initState() {
    super.initState();
    _recuperarServidores();
  }

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
                  itemCount: secretaria.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      width: 280,
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
                          Text(secretaria[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black))
                        ],
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
                  itemCount: gabinete.length,
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
                      child: Column(
                        children: [
                          Text(gabinete[index]['nome'])
                        ],
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
                  itemCount: secretarias_adjuntas.length,
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
                      child: Column(
                        children: [
                          Text(secretarias_adjuntas[index]['nome'])
                        ],
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
                  itemCount: assessoria_juridico_lesgislativa.length,
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
                      child: Column(
                        children: [
                          Text(assessoria_juridico_lesgislativa[index]['nome'])
                        ],
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
                  itemCount: diretoria_executiva.length,
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
                      child: Column(
                        children: [
                          Text(diretoria_executiva[index]['nome'])
                        ],
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
                  itemCount: controladoria_setorial.length,
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
                      child: Column(
                        children: [
                          Text(controladoria_setorial[index]['nome'])
                        ],
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
                  itemCount: subsecretarias.length,
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
                      child: Column(
                        children: [
                          Text(subsecretarias[index]['nome'])
                        ],
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
                  itemCount: superintendencias.length,
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
                      child: Column(
                        children: [
                          Text(superintendencias[index]['nome'])
                        ],
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
                  itemCount: unidades_referencia.length,
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
                      child: Column(
                        children: [
                          Text(unidades_referencia[index]['nome'])
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Órgãos Vinculados',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orgaos_vinculados.length,
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
                      child: Column(
                        children: [
                          Text(orgaos_vinculados[index]['nome'])
                        ],
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

