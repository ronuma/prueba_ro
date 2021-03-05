import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_ro/screens/video_screen.dart';
import 'package:prueba_ro/services/widgets.dart';
import 'package:prueba_ro/screens/loading_screen.dart';

//Pantalla de acceso, diseño y funcionalidad

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'Ingresar',
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
                  title: 'Entrar',
                  //callback anonimo que inicia la sesion del usuario
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user == null) {
                        Navigator.pushNamed(context, LoadingScreen.id);
                      } else if (user != null) {
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
      ),
    );
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
    content: Text('Hubo un error al iniciar sesión, intente nuevamente.'),
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
