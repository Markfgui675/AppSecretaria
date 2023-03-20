import 'package:app_secretaria_flutter/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    home: AuthService().handleAuthState(),
    debugShowCheckedModeBanner: false,
  ));
}