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
  dynamic _nomeUsuarioLogado = '';
  dynamic _emailUsuarioLogado = '';
  String _profilepic = '';

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
            info.add(dados['nome']);
            info.add(dados['email']);
            info.add(dados['profilepic']);
            _nomeUsuarioLogado = info[0];
            _emailUsuarioLogado = info[1];
            _profilepic = info[2];
            if (_profilepic == null){
              _profilepic = '';
            }
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
      color: const Color(0xff2E6EA7),
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _nomeUsuarioLogado.length > 20 ? Text(_nomeUsuarioLogado,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
              ) : Text(_nomeUsuarioLogado,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
              _emailUsuarioLogado.length > 20 ? Text(_emailUsuarioLogado,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
              ) : Text(_emailUsuarioLogado,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundColor: const Color(0xfff2ab11),
                  backgroundImage:
                  _profilepic != ''
                      ?  null
                      :  NetworkImage(_profilepic)
              ),
            ],
          )
        ],
      ),
    );
  }
}

