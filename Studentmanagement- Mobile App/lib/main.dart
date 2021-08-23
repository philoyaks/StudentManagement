import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentmanagement_app/constants.dart';
import 'package:studentmanagement_app/screens/Auth_Screens/loginScreen.dart';
import 'package:studentmanagement_app/screens/Auth_Screens/signUpScreen.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customThemData,
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
