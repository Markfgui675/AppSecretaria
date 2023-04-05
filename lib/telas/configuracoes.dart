import 'package:app_secretaria_flutter/telas/entrada.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {

  bool loading = false;

  sair() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Entrada()));
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  _mensagemSnackBar(bool ok){

    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: const Text('Mudanças Salvas'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
      setState(() {
        loading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: const Text(
                'Não foi possível fazer as mudanças.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
      setState(() {
        loading = false;
      });
    }
  }

  _salvarMudancas(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25,),
            CircleAvatar(
              maxRadius: 75,
            ),
            SizedBox(height: 25,),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Nome usuario',
                  ),
                  validator: (value){
                    if(value!.length <= 1){
                      return 'Digite um nome';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: (){
                sair();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('icons/logout.png', width: 25, height: 25,),
                    SizedBox(width: 8,),
                    Text('Sair',
                      style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              )
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                _salvarMudancas();
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
                  children: (loading)?[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                    )
                  ] : [
                    Container(
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Entrar',
                            style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff2E6EA7)),
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
      )
    );
  }
}
