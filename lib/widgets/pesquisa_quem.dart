import 'package:app_secretaria_flutter/widgets/filtros_quem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Servidor.dart';
import '../telas/servidor.dart';

class PesquisaQuem extends StatefulWidget {
  String dropValueName;
  String dropValueSetor;
  String dropValueEndereco;

  PesquisaQuem(this.dropValueName, this.dropValueSetor, this.dropValueEndereco);

  @override
  State<PesquisaQuem> createState() => _PesquisaQuemState();
}

class _PesquisaQuemState extends State<PesquisaQuem> {

  List<Servidor> servidores = [];

  _recuperarServidorFiltrados() async {

    FirebaseFirestore db = FirebaseFirestore.instance;

    if(dropValueNome != ''){
      QuerySnapshot querySnapshot = await db.collection('qq_pesquisa').where('nome', isEqualTo: dropValueNome).get().then(
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
              servidores.add(servidor);
            }
            print('Lista adicionada pelo dropValueNome');
            print(servidores);
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    }
    if(dropValueSetor != ''){
      QuerySnapshot querySnapshot = await db.collection('qq_pesquisa').where('setor', isEqualTo: dropValueSetor).get().then(
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
              servidores.add(servidor);
            }
            print('Lista adicionada pelo dropValueSetor');
            print(servidores);
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
    }
    if(dropValueEndereco != ''){
      QuerySnapshot querySnapshot = await db.collection('qq_pesquisa').where('endereco', isEqualTo: dropValueEndereco).get().then(
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
              servidores.add(servidor);
            }
            print('Lista adicionada pelo dropValueEndereco');
            print(servidores);
            return querySnapshot;
          },
          onError: (e) => print("Error completing: $e")
      );
      if(dropValueNome == '' && dropValueSetor == '' && dropValueEndereco == ''){
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
                servidores.add(servidor);
              }
              print(servidores);
              return querySnapshot;
            },
            onError: (e) => print("Error completing: $e")
        );
      }
    }

  }

  _recuperarServidores() async {

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
            servidores.add(servidor);
          }
          print(servidores);
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  @override
  void initState() {
    super.initState();
    _recuperarServidorFiltrados();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 180,
            child: ListView.builder(
              itemCount: servidores.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (_, index){

                List<Servidor> listaServidores = servidores;
                Servidor servidor = listaServidores[index];

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServidorScreen(servidor)));
                  },
                  child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(servidor.nome)
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

