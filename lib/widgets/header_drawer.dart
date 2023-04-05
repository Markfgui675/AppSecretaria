import 'package:app_secretaria_flutter/Model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({Key? key}) : super(key: key);

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {

  Usuario usuario = Usuario();
  String? _idUsuarioLogado;
  List info = [];
  dynamic _nomeUsuarioLogado = 'NomeUsuario';
  dynamic _emailUsuarioLogado = 'Email@usuario';

  _recuperarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore dbUser = FirebaseFirestore.instance;
    User? user = await auth.currentUser;
    _idUsuarioLogado = user!.uid;
    print(_idUsuarioLogado);
    final docRef = await dbUser.collection('usuarios').doc(_idUsuarioLogado);

    docRef.get().then(
        (DocumentSnapshot doc){
          final dados = doc.data() as Map<String, dynamic>;
          print(dados);
          setState(() {
            _nomeUsuarioLogado = dados['nome'];
            _emailUsuarioLogado = dados['email'];
            info.add(_nomeUsuarioLogado);
            info.add(_emailUsuarioLogado);
          });
          print(info);
          return info;
        },
      onError: (e) => print('Error getting document: ${e}')
    );

  }

  @override
  void initState() {
    super.initState();
    _recuperarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, right: 12, left: 12),
      color: Color(0xff2E6EA7),
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(info[0].toString(),
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 26, color: Colors.white),
              ),
              Text(info[1].toString(),
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey[200]),
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('imagens/secretaria_teste.jpg'),
                    fit: BoxFit.cover
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

