import 'package:flutter/material.dart';
import 'package:prueba_ro/screens/home_screen.dart';
import 'package:prueba_ro/screens/loading_screen.dart';
import 'package:prueba_ro/screens/login_screen.dart';
import 'package:prueba_ro/screens/video_screen.dart';
import 'file:///C:/Users/Acer/Desktop/Curso_Flutter/prueba_ro/lib/services/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Registrarse',
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 60.0,
                  right: 60.0,
                  top: 25.0,
                  bottom: 10.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'correo electrónico',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 60.0,
                  right: 60.0,
                  bottom: 25.0,
                ),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'contraseña',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              StyleButton(
                title: 'Registrarse y entrar',
                //callback anonimo que registra al usuario en Firebase
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser == null) {
                      Navigator.pushNamed(context, VideoScreen.id);
                    } else if (newUser != null) {
                      Navigator.pushNamed(context, VideoScreen.id);
                    }
                  } catch (e) {
                    showAlertDialog(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    color: Colors.lightGreen,
    child: Text(
      'OK',
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('ERROR'),
    content: Text('Hubo un error al realizar el registro, intente nuevamente.'),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
