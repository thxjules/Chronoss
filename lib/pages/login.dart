import 'package:flutter/material.dart';
import 'package:chronos/components/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // Controladores
  final nombreusuarioController = TextEditingController();
  final passwordController = TextEditingController();

  // Función de login
  void loginUser(BuildContext context) async {
    final email = nombreusuarioController.text.trim();
    final password = passwordController.text.trim();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navegar a la siguiente pantalla si el login es exitoso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Bienvenido de nuevo, $email!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de inicio de sesión: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( // Para que se vea bien en pantallas pequeñas
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),

                // Logo
                Image.asset(
                  'assets/logo2.png',
                  height: 250,
                ),

                SizedBox(height: 30),

                // Texto de bienvenida
                Text(
                  '¡Te extrañamos!',
                  style: TextStyle(
                    color: Color(0xFFC6AFEF),
                    fontSize: 26,
                  ),
                ),

                SizedBox(height: 25),

                // Campo usuario
                MyTextField(
                  controller: nombreusuarioController,
                  hintText: 'Correo electrónico',
                  obscureText: false,
                ),

                SizedBox(height: 10),

                // Campo contraseña
                MyTextField(
                  controller: passwordController,
                  hintText: 'Contraseña',
                  obscureText: true,
                ),

                SizedBox(height: 25),

                // Botón login
                ElevatedButton(
                  onPressed: () => loginUser(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6AFEF),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                SizedBox(height: 20),

                 // Botón registro
                ElevatedButton(
                  onPressed: () => loginUser(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC6AFEF),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
