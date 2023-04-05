import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home.dart';
import '../Model/Usuario.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  Usuario usuario = Usuario();

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  _mensagemSnackBar(bool ok) {
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: Text('Login executado com sucesso!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            content: Text(
                'Não foi possível fazer o login. Verifique o email e senha e tente novamente.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 6),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            behavior: SnackBarBehavior.floating,
          )
      );
    }
  }

  createWithEmailAndPassword(String email, String senha){
    setState(() {
      loading = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore dbUsers= FirebaseFirestore.instance;

    auth.createUserWithEmailAndPassword(
        email: email,
        password: senha
    ).then((firebaseUser){
      _mensagemSnackBar(true);

      dbUsers.collection('usuarios').doc().set(usuario.toMap());

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Home()), (_) => false);
      _nomeController.text = '';
      _emailController.text = '';
      _senhaController.text = '';
    }).catchError((error){
      print(error.toString());
      _mensagemSnackBar(false);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar',
          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white
        )),
        centerTitle: true,
        backgroundColor: Color(0xff2E6EA7),
        elevation: 0,
      ),



      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Form(
                key: formKey,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _nomeController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Nome',
                          ),
                          validator: (value){
                            if(value!.isEmpty || value.length <= 1){
                              return 'Informe um nome!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Email',
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Informe um email!';
                            } else if(!value.contains('@') || !value.contains('.com')){
                              return 'Informe um email válido!';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          controller: _senhaController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: 'Senha',
                          ),
                          validator: (value){
                            if(value!.length < 6){
                              return 'Digite uma senha com pelo menos 6 caracteres';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                            autofocus: true,
                            onPressed: (){
                              if(formKey.currentState!.validate()){
                                createWithEmailAndPassword(_emailController.text, _senhaController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xfff2ab11),
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      Text('Criar conta',
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
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 2,
                    width: 45,
                    color: Colors.grey[400],
                  ),
                  Text('Ou entre com o Google',
                    style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.grey[600]),
                  ),
                  Container(
                    height: 2,
                    width: 45,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context)=>Home()), (route) => false
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('imagens/google.png', width: 35, height: 35,),
                        SizedBox(width: 12,),
                        Text('Entrar com o Google',
                          style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
