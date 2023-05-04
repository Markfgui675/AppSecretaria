import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class QuemQuem extends StatefulWidget {
  const QuemQuem({Key? key}) : super(key: key);

  @override
  State<QuemQuem> createState() => _QuemQuemState();
}

class _QuemQuemState extends State<QuemQuem> {

  bool loading = false;

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

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = false;
    });

  }
  _recuperaGabinete() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaSecretariaAdjuntas() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaAssesorias() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaDiretoriaExecutiva() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaControladoria() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaSubsecretarias() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaSuperintendencias() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaUnidadesReferenciais() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

  }
  _recuperaOrgaosVinculados() async {

    setState(() {
      loading = true;
    });
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
    setState(() {
      loading = true;
    });

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

  double width_containers = 280;
  double height_containers = 210;

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
              const SizedBox(height: 5,),
              SizedBox(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: secretaria.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    if(!loading){
                      return Center(child: CircularProgressIndicator(),);
                    } else {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 20),
                        width: width_containers,
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
                            Text(secretaria[index]['nome'],
                                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                            const SizedBox(height: 8,),
                            Container(width: 180, height: 5, color: Colors.orange,),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                const SizedBox(width: 5,),
                                Text(secretaria[index]['telefone'],
                                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                const SizedBox(width: 5,),
                                Text(secretaria[index]['endereco'],
                                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                              ],
                            )

                          ],
                        ),
                      );
                    }
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
              Text('Gabinete',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: gabinete.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gabinete[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Wrap(
                                children: [
                                  Text(gabinete[index]['telefone'],
                                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(gabinete[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Secretarias Adjuntas',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: secretarias_adjuntas.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(secretarias_adjuntas[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(secretarias_adjuntas[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(secretarias_adjuntas[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Assessoria Jurídico-Legislativa',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: assessoria_juridico_lesgislativa.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      width: width_containers,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(assessoria_juridico_lesgislativa[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(assessoria_juridico_lesgislativa[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(assessoria_juridico_lesgislativa[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Diretoria Executiva do Fundo de Saúde do Distrito Federal',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: diretoria_executiva.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(diretoria_executiva[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(diretoria_executiva[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(diretoria_executiva[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Controladoria Setorial da Saúde',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controladoria_setorial.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(controladoria_setorial[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(controladoria_setorial[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(controladoria_setorial[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Subsecretarias',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: subsecretarias.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(subsecretarias[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(subsecretarias[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(subsecretarias[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Superintendências',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: superintendencias.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(superintendencias[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(superintendencias[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(superintendencias[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
        const SizedBox(height: 50,),


        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Unidades de Referência Distrital ',
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
              ),
              const SizedBox(height: 5,),
              Container(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: unidades_referencia.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(unidades_referencia[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(unidades_referencia[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(unidades_referencia[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: orgaos_vinculados.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(orgaos_vinculados[index]['nome'],
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),
                          const SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(orgaos_vinculados[index]['telefone'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                              const SizedBox(width: 5,),
                              Text(orgaos_vinculados[index]['endereco'],
                                  style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                            ],
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

      ],
    );
  }
}

