import 'package:app_secretaria_flutter/utild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  login() async {
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if(googleUser != null){
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken
      );
      
      UserCredential userCredential = await auth.signInWithCredential(credential);
      User? user = userCredential.user!;

      print(userCredential.toString());
      print(user.toString());

      userCollection.doc(user.uid).set({
        'id': user.uid,
        'nome': user.displayName,
        'email': user.email,
        'profilepic':user.photoURL
      });
    }
    return googleUser;
  }
}