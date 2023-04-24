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
          Container(
            height: 180,
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

