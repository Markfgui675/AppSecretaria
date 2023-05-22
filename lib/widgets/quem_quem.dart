import 'package:app_secretaria_flutter/View/quem_quem/filtra_quem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Servidor.dart';
import '../View/servidor.dart';

class QuemQuem extends StatefulWidget {
  const QuemQuem({Key? key}) : super(key: key);

  @override
  State<QuemQuem> createState() => _QuemQuemState();
}

class _QuemQuemState extends State<QuemQuem> {

  bool loading = false;

  List<Servidor> secretaria = [];
  List<Servidor> gabinete = [];
  List<Servidor> secretarias_adjuntas = [];
  List<Servidor> assessoria_juridico_lesgislativa = [];
  List<Servidor> diretoria_executiva = [];
  List<Servidor> controladoria_setorial = [];
  List<Servidor> subsecretarias = [];
  List<Servidor> superintendencias = [];
  List<Servidor> unidades_referencia = [];
  List<Servidor> orgaos_vinculados = [];

  _recuperaSecretaria() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('secretaria').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              secretaria.add(servidor);
            });
          }
          print(secretaria);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaGabinete() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('gabinete').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              gabinete.add(servidor);
            });
          }
          print(gabinete);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaSecretariaAdjuntas() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('secretarias_adjuntas').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              secretarias_adjuntas.add(servidor);
            });
          }
          print(secretarias_adjuntas);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaAssesorias() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('assessoria_juridico_lesgislativa').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              assessoria_juridico_lesgislativa.add(servidor);
            });
          }
          print(assessoria_juridico_lesgislativa);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaDiretoriaExecutiva() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('diretoria_executiva').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              diretoria_executiva.add(servidor);
            });
          }
          print(diretoria_executiva);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaControladoria() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('controladoria_setorial').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              controladoria_setorial.add(servidor);
            });
          }
          print(controladoria_setorial);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaSubsecretarias() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('subsecretarias').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              subsecretarias.add(servidor);
            });
          }
          print(subsecretarias);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaSuperintendencias() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection('qq_motra').doc('superintendencias').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              superintendencias.add(servidor);
            });
          }
          print(superintendencias);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaUnidadesReferenciais() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('unidades_referencia').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              unidades_referencia.add(servidor);
            });
          }
          print(unidades_referencia);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }
  _recuperaOrgaosVinculados() async {

    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot =
    await db.collection('qq_motra').doc('orgaos_vinculados').collection('servidores').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              orgaos_vinculados.add(servidor);
            });
          }
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

  Widget _estrutraPadraoCaixa(String titulo, List<Servidor> lista){

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(titulo,
            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            height: height_containers,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lista.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (_, index){

                Servidor servidor = lista[index];

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServidorScreen(servidor)));
                  },
                  child: Container(
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
                              offset: const Offset(0, 0)
                          )
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(servidor.nome,
                            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                        const SizedBox(height: 8,),
                        Container(width: 180, height: 5, color: Colors.orange,),
                        const SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                            const SizedBox(width: 5,),
                            Text(servidor.telefone,
                                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                            const SizedBox(width: 5,),
                            Text(servidor.endereco,
                                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                          ],
                        )

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

        //Container Secretária de Saúde (ESPECIAL)
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Secretária de Saúde',
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: const Color(0xff2E6EA7)),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FiltraQuem()));
                    },
                    child: Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                        border: const Border(),
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xfff2ab11),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Pesquisar',
                            style: GoogleFonts.kanit().copyWith(
                                fontWeight: FontWeight.bold, fontSize: 16, color: const Color(0xff2E6EA7)),
                          ),
                          const SizedBox(width: 5,),
                          const Icon(Icons.search, color: Color(0xff2E6EA7),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5,),
              SizedBox(
                height: height_containers,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: secretaria.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (_, index){

                    Servidor servidor = secretaria[index];

                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServidorScreen(servidor)));
                      },
                      child: Container(
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
                            Text(servidor.nome,
                                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                            const SizedBox(height: 8,),
                            Container(width: 180, height: 5, color: Colors.orange,),
                            const SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.phone, size: 20, color: Color(0xff2E6EA7),),
                                const SizedBox(width: 5,),
                                Text(servidor.telefone,
                                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const FaIcon(FontAwesomeIcons.mapLocationDot, size: 20, color: Color(0xff2E6EA7),),
                                const SizedBox(width: 5,),
                                Text(servidor.endereco,
                                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black))
                              ],
                            )

                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 50,),

        _estrutraPadraoCaixa('Gabinete', gabinete),
        const SizedBox(height: 50,),

        _estrutraPadraoCaixa('Secretarias Adjuntas', secretarias_adjuntas),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Assesoria Jurídico-Legislativa', assessoria_juridico_lesgislativa),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Diretoria Executiva do Fundo de Saúde do Distrito Federal', diretoria_executiva),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Controladoria Setorail da Saúde', controladoria_setorial),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Subsecretarias', subsecretarias),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Superintedências', superintendencias),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Unidades de Referência Distrital', unidades_referencia),
        const SizedBox(height: 50,),


        _estrutraPadraoCaixa('Órgãos Vinculados', orgaos_vinculados),
        const SizedBox(height: 50,),

      ],
    );
  }
}

