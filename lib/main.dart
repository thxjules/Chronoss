import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //color de fondo
      body: Stack(
        children: [
          Positioned.fill(
            top: 100, //margen para bajar el logo
            child: Image.asset(
              'assets/logo1.jpg', //logo chronos
              fit: BoxFit.contain,
              alignment: Alignment.topCenter,
            ),
          ),
          //botones
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //botón login
                  customButton('Accede al Portal', const Color(0xFFC6AFEF), () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),

                  const SizedBox(height: 20),

                  // Botón registro
                  customButton('Atomiza tu fusión', Colors.white, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),

                  const SizedBox(height: 20),

                  //botón de iniciar sin cuenta 
                  customButton('Explorador Cuántico', const Color(0xFFC6AFEF), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget customButton(String text, Color bgColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      child: Text(text),
    );
  }
}
