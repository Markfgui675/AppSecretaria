import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

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
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
        email: email,
        password: senha
    ).then((firebaseUser){
      _mensagemSnackBar(true);
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
        title: Text('Criar conta'),
        centerTitle: true,
        backgroundColor: Color(0xff2E6EA7),
        elevation: 0,
      ),



      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _nomeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: _senhaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: (){
                    createWithEmailAndPassword(_emailController.text, _senhaController.text);
                  },
                  child: Text('Entrar')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
