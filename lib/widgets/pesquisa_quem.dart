import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Servidor.dart';
import '../telas/servidor.dart';

class PesquisaQuem extends StatefulWidget {
  String ValueName;
  String ValueSetor;
  String ValueEndereco;

  PesquisaQuem(this.ValueName, this.ValueSetor, this.ValueEndereco);

  @override
  State<StatefulWidget> createState() => _PesquisaQuemState();

}

class _PesquisaQuemState extends State<PesquisaQuem> {

  QuerySnapshot? snapshot;
  List<Servidor> servidores = [];

  recuperarServidorFiltrados() async {

    FirebaseFirestore db = FirebaseFirestore.instance;

    if(widget.ValueName != '' && widget.ValueSetor != '' && widget.ValueEndereco != ''){
      print('Recuperação com filtragem');
      print('todos os filtros');
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: widget.ValueName)
          .where('setor', isEqualTo: widget.ValueSetor)
          .where('endereco', isEqualTo: widget.ValueEndereco).get().then(
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
    } else if(widget.ValueName == '' && widget.ValueSetor != '' && widget.ValueEndereco != ''){
      //Pesquisa com setor e endereço - SE
      print('Recuperação com filtragem');
      print('setor e endereço');
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('setor', isEqualTo: widget.ValueSetor)
          .where('endereco', isEqualTo: widget.ValueEndereco).get().then(
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
    } else if(widget.ValueName != '' && widget.ValueSetor == '' && widget.ValueEndereco != ''){
      //pesquisa com nome e endereço - NE
      print('Recuperação com filtragem');
      print('nome e endereço');
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: widget.ValueName)
          .where('endereco', isEqualTo: widget.ValueEndereco).get().then(
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
    } else if(widget.ValueName != '' && widget.ValueSetor != '' && widget.ValueEndereco == ''){
      //pesquisa com nome e setor - NS
      print('Recuperação com filtragem');
      print('nome e setor');
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: widget.ValueName)
          .where('setor', isEqualTo: widget.ValueSetor).get().then(
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
    } else if(widget.ValueName != '' && widget.ValueSetor == '' && widget.ValueEndereco == ''){
      //pesquisa apenas nome - N
      print('Recuperação com filtragem');
      print('nome');
      print(widget.ValueName);
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: "${widget.ValueEndereco}").get().then(
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
    } else if(widget.ValueName == '' && widget.ValueSetor != '' && widget.ValueEndereco == ''){
      //pesquisa apenas setor - S
      print('Recuperação com filtragem');
      print('setor');
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('setor', isEqualTo: widget.ValueEndereco).get().then(
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
    } else if(widget.ValueName == '' && widget.ValueSetor == '' && widget.ValueEndereco != ''){
      //pesquisa apenas com endereço - S
      print('Recuperação com filtragem');
      print('endereço');
      QuerySnapshot querySnapshott = await db.collection('qq_pesquisa')
          .where('endereco', isEqualTo: widget.ValueEndereco).get().then(
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
    QuerySnapshot querySnapshot = await db.collection('qq_pesquisa').get().then(
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
    recuperarServidorFiltrados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height*1.8,
            child: ListView.builder(
              itemCount: servidores.length,
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
                              offset: Offset(0, 0)
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
      ),
    );
  }
}

