import 'package:flutter/material.dart';
import 'dart:math';

class BotaoExercicios extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  BotaoExercicios({required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(
          texto,
          style: TextStyle(fontSize: 20),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Color.fromRGBO(65, 177, 79, 1),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
