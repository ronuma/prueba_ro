import 'package:flutter/material.dart';
import 'package:prueba_ro/screens/home_screen.dart';
import 'package:prueba_ro/screens/login_screen.dart';
import 'package:prueba_ro/screens/registration_screen.dart';
import 'package:prueba_ro/screens/video_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prueba_ro/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'MontserratAlternate',
      ),
      debugShowCheckedModeBanner: true,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        VideoScreen.id: (context) => VideoScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
      },
    );
  }
}
