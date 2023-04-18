import 'package:app_secretaria_flutter/telas/entrada.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Model/Usuario.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  bool loading = false;
  Usuario usuario = Usuario();
  String? _idUsuarioLogado;
  List info = [];
  dynamic _nomeUsuarioLogado = '';
  dynamic _emailUsuarioLogado = '';
  String _profilepic = '';

  sair(){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Deseja realmente sair?'),
            actions: [
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        await auth.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Entrada()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff2ab11),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Sair',
                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff2E6EA7)),
                        )]
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfff2ab11),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Cancelar',
                            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff2E6EA7)),
                          )]
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  _mensagemSnackBar(bool ok) {
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 6.0,
        content: const Text('Mudanças Salvas'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ));
      setState(() {
        loading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 6.0,
        content: const Text('Não foi possível fazer as mudanças.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ));
      setState(() {
        loading = false;
      });
    }
  }

  _recuperarDados() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore dbUser = FirebaseFirestore.instance;
    User? user = await auth.currentUser;
    _idUsuarioLogado = user!.uid;
    print(_idUsuarioLogado);
    final docRef = await dbUser.collection('usuarios').doc(_idUsuarioLogado);

    docRef.get().then((DocumentSnapshot doc) {
      final dados = doc.data() as Map<String, dynamic>;
      print(dados);
      setState(() {
        info.add(dados['nome']);
        info.add(dados['email']);
        info.add(dados['profilepic']);
        _nomeUsuarioLogado = info[0];
        _emailUsuarioLogado = info[1];
        _nameController.text = _nomeUsuarioLogado;
        _profilepic = info[2];
        print(_profilepic);
      });
      print(info);
      return info;
    }, onError: (e) => print('Error getting document: ${e}'));
  }

  _salvarMudancas(String name) {

    FirebaseFirestore dbUser = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {
      'nome': name
    };

    dbUser.collection('usuarios').doc(_idUsuarioLogado).update(dadosAtualizar).
    then((value){
      _mensagemSnackBar(true);
    }).catchError((e){
      _mensagemSnackBar(false);
    });

  }

  @override
  void initState() {
    super.initState();
    _recuperarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.89,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  maxRadius: 75,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                    _profilepic != ''
                        ?  null
                        :  NetworkImage(_profilepic)
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      controller: _nameController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Nome do Usuário'),
                      validator: (value) {
                        if (value!.length <= 1) {
                          return 'Digite um nome';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Icon(Icons.alternate_email),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        _emailUsuarioLogado,
                        style: GoogleFonts.kanit().copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      sair();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'icons/logout.png',
                            width: 25,
                            height: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Sair',
                            style: GoogleFonts.kanit().copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      _salvarMudancas(_nameController.text);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border(),
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xfff2ab11),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: (loading)
                          ? [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              Container(
                                height: 60,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Salvar',
                                      style: GoogleFonts.kanit().copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xff2E6EA7)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
