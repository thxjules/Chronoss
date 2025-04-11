import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chronos/components/text_field.dart';

class Register extends StatelessWidget {
  Register({super.key});

  //Constantes
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser(BuildContext context) async { //función asincronica (otras tareas se ejecutan mientras)

  final email =emailController.text.trim(); // .trim eliminar espacios en un string
  final password =passwordController.text.trim();
  

  if (email.isEmpty || password.isEmpty){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Completa los datos')),
    );
  return;    
  }


//llamar a firebase
try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Cuenta creada exitosamente!')),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar: $e')),
      );
    }
  }



@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        // Imagen de fondo
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fondo1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Contenido encima de la imagen
        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  // Ya no necesitas el container vacío aquí
                  
                  Image.asset(
                    'assets/logo2.png',
                    height: 250,
                  ),

                  SizedBox(height: 30),
                  Text(
                    '¡Siente las ondas impactar en tu cerebro!',
                    style: TextStyle(
                      color: Color(0xFFC6AFEF),
                      fontSize: 26,
                    ),
                  ),

                  SizedBox(height: 25),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Correo electrónico',
                    obscureText: false,
                  ),
                  
                  SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Contraseña',
                    obscureText: true,
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () => registerUser(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Registrarse', style: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 173, 187, 255),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('¿ya tienes una cuenta?', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
