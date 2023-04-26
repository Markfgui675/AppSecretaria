import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Servidor.dart';
import '../telas/servidor.dart';

class PesquisaQuem extends StatefulWidget {
  String valueName;
  String valueSetor;
  String valueEndereco;

  PesquisaQuem(this.valueName, this.valueSetor, this.valueEndereco, {super.key});

  @override
  State<StatefulWidget> createState() => _PesquisaQuemState();

}

class _PesquisaQuemState extends State<PesquisaQuem> {

  QuerySnapshot? snapshot;
  List<Servidor> servidores = [];

  recuperarServidorFiltrados(String nome, String setor, String endereco) async {

    FirebaseFirestore db = FirebaseFirestore.instance;

    if(nome != '' && setor != '' && endereco != ''){
      await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: nome)
          .where('setor', isEqualTo: setor)
          .where('endereco', isEqualTo: endereco).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome == '' && setor != '' && endereco != ''){
      //Pesquisa com setor e endereço - SE
      print('Recuperação com filtragem');
      print('setor e endereço');
      await db.collection('qq_pesquisa')
          .where('setor', isEqualTo: setor)
          .where('endereco', isEqualTo: endereco).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome != '' && setor == '' && endereco != ''){
      //pesquisa com nome e endereço - NE
      print('Recuperação com filtragem');
      print('nome e endereço');
      await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: nome)
          .where('endereco', isEqualTo: endereco).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome != '' && setor != '' && endereco == ''){
      //pesquisa com nome e setor - NS
      print('Recuperação com filtragem');
      print('nome e setor');
      await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: nome)
          .where('setor', isEqualTo: setor).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome != '' && setor == '' && endereco == ''){
      //pesquisa apenas nome - N
      print('Recuperação com filtragem');
      print('nome');
      await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: nome).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome == '' && setor != '' && endereco == ''){
      //pesquisa apenas setor - S
      print('Recuperação com filtragem');
      print('setor');
      await db.collection('qq_pesquisa')
          .where('setor', isEqualTo: endereco).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome == '' && setor == '' && endereco != ''){
      //pesquisa apenas com endereço - S
      print('Recuperação com filtragem');
      print('endereço');
      await db.collection('qq_pesquisa')
          .where('endereco', isEqualTo: endereco).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              setState(() {
                servidores.add(servidor);
              });
            }
            print(servidores);
            snapshot = querySnapshot;
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else {
      _recuperarServidores();
    }
  }

  _recuperarServidores() async {

    print('Recuperação sem filtragem');
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('qq_pesquisa').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            //servidores1.add(docSnapshot.data());
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            setState(() {
              servidores.add(servidor);
            });
          }
          print(servidores);
          snapshot = querySnapshot;
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  @override
  void initState() {
    recuperarServidorFiltrados(widget.valueName, widget.valueSetor, widget.valueEndereco);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: servidores.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                itemBuilder: (_, index){

                  Servidor servidor = servidores[index];
                  print('$servidor no index $index');

                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServidorScreen(servidor)));
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
                          Text(servidor.nome,
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
        ],
    );
  }
}

