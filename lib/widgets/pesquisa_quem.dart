import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PesquisaQuem extends StatefulWidget {
  const PesquisaQuem({Key? key}) : super(key: key);

  @override
  State<PesquisaQuem> createState() => _PesquisaQuemState();
}

class _PesquisaQuemState extends State<PesquisaQuem> {

  List servidores = [];
  _recuperarServidores() async {

    List servidores1 = [];
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await db.collection('qq_pesquisa').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            servidores1.add(docSnapshot.data());
          }
          print(servidores1);
          setState(() {
            servidores = servidores1;
          });
          return querySnapshot;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  @override
  void initState() {
    super.initState();
    _recuperarServidores();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(servidores[index]['nome'])
                    ],
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

