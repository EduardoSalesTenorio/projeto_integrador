import 'package:flutter/material.dart';

class BotaoExercicios extends StatefulWidget {
  final String texto;
  final Color cor;
  final void Function() quandoSelecionado;

  BotaoExercicios(this.texto, this.cor, this.quandoSelecionado);

  @override
  _BotaoExerciciosState createState() => _BotaoExerciciosState();
}

class _BotaoExerciciosState extends State<BotaoExercicios> {
  bool _isVisible = true;

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
                backgroundColor: widget.cor,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
