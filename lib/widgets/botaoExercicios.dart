import 'package:flutter/material.dart';
import 'dart:math';

class BotaoExercicios extends StatefulWidget {
  final String texto;
  final void Function() quandoSelecionado;




  BotaoExercicios(this.texto, this.quandoSelecionado);

  @override
  _BotaoExerciciosState createState() => _BotaoExerciciosState();
}

class _BotaoExerciciosState extends State<BotaoExercicios> {
  bool _isVisible = true;

  List<Color> cores = [
    Color.fromRGBO(65, 177, 79, 1),
    Color.fromRGBO(147, 35, 133, 1),
    Color.fromRGBO(20, 126, 186, 1),
    Color.fromRGBO(230, 126, 37, 1),
    Color.fromRGBO(37, 68, 65, 1),
    Color.fromRGBO(255, 193, 207, 1),
    Color.fromRGBO(0, 108, 103, 1),
    Color.fromRGBO(20, 126, 186, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Column(
        children: [
          SizedBox(height: 5),
          SizedBox(
            width: 250, // Define a largura do botão
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _isVisible = false; // Torna o botão invisível quando clicado
                });
                widget.quandoSelecionado(); // Chama a função quando o botão é selecionado
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.texto,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: cores[Random().nextInt(cores.length)],
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
