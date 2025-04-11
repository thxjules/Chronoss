import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller; //constante para el controlador
  final String hintText; // constante paratexto dentro de guía
  final bool obscureText; //constante para proteger el texto

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 220, 212, 237))),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 162, 128, 240)),
            ),
            filled: false, //relleno del imput
            hintText: hintText,
          )),
    );
  }
}
