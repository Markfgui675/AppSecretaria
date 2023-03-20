import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home.dart';
import '../auth_service.dart';
import 'cadastro.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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

  singInWithEmailAndPassword(String email, String senha) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signInWithEmailAndPassword(
        email: email,
        password: senha
    ).then((firebaseUser){
      _mensagemSnackBar(true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      _emailController.text = '';
      _senhaController.text = '';
    }).catchError((error){
      print(error.toString());
      _mensagemSnackBar(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                          singInWithEmailAndPassword(_emailController.text, _senhaController.text);
                          AuthService().setGoogle(false);
                        },
                        child: Text('Entrar')
                    ),
                    SizedBox(height: 15,),
                    ElevatedButton(
                        onPressed: (){
                          AuthService().signInWithGoogle();
                          AuthService().setGoogle(true);
                        },
                        child: Text('Entrar com o google')
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                      },
                      child: Text('Esqueceu a senha?'),
                    ),
                    SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()));
                      },
                      child: Text('Criar conta'),
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}
