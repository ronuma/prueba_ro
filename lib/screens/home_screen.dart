import 'package:flutter/material.dart';
import 'package:prueba_ro/screens/login_screen.dart';
import 'package:prueba_ro/screens/registration_screen.dart';
import 'package:prueba_ro/services/widgets.dart';

// Pantalla Principal
// Título y botones que llevan a las demás pantallas (Registro e Ingreso)

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 180.0),
            child: Column(
              children: [
                Text(
                  'VideoApp',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                StyleButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  title: 'Ingresar',
                ),
                SizedBox(
                  height: 18.0,
                ),
                StyleButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  title: 'Registrarse',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
