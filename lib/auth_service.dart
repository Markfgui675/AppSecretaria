import 'package:app_secretaria_flutter/telas/inicio.dart';
import 'package:app_secretaria_flutter/telas/entrada.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Home.dart';

class AuthService{
  // 1. handleAuthState()

  // 2. signInWithGoogle()

  // 3. signOut()

  //Respectivamente---------------------------------------

  bool google = false;

  setGoogle(bool google){
    google = google;
  }

  googleTf(){
    return google;
  }

  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return Home();
        } else {
          return Entrada();
        }
      },
    );
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>['email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut(){
    FirebaseAuth.instance.signOut();
  }

}