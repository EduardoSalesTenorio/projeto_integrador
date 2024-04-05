import 'package:flutter/material.dart';
import '../telas/menu.dart';


// O botão fica invisivel depois do toque



class BotaoExercicios extends StatefulWidget {
  final String texto;
  final Color cor;

  BotaoExercicios(this.texto, this.cor);

  @override
  _BotaoExerciciosState createState() => _BotaoExerciciosState();
}

class _BotaoExerciciosState extends State<BotaoExercicios> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Container(
        width: 200,
        child: OutlinedButton(
          onPressed: () {
            setState(() {
              _isVisible = false; // Torna o botão invisível quando clicado
            });
          },
          child: Text(
            widget.texto,
            style: TextStyle(fontSize: 25),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: widget.cor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
