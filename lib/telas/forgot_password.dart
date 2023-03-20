import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController _emailController = TextEditingController();

  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    } on FirebaseAuth catch (e){
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar Senha'),
        centerTitle: true,
        backgroundColor: Color(0xff2E6EA7),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Text('Recuperar senha'),
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
          MaterialButton(
              onPressed: (){
                passwordReset();
              },
            child: Text('Recuperar senha', style: TextStyle(color: Colors.white)),
            color: Color(0xff2E6EA7),
          )
        ],
      ),
    );
  }
}
