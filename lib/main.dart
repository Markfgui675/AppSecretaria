import 'package:app_secretaria_flutter/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: AuthService().handleAuthState(),
    debugShowCheckedModeBanner: false,
  ));

}