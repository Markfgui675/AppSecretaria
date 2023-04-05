import 'package:app_secretaria_flutter/auth_service.dart';
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

  sair() async {
    if(AuthService().googleTf()){
      AuthService().signOut();
    } else {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Entrada()));
    }
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

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
            )
          ],
        ),
      )
    );
  }
}
