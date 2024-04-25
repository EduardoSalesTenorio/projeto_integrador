import 'package:flutter/material.dart';
import '../telas/exercicios.dart';

class BotaoNiveis extends StatelessWidget {
  String texto = "";
  final estrela;

  BotaoNiveis(this.texto, this.estrela);

  @override
  Widget build(BuildContext context) {
    IconData icone;
    Color corIcone;
    VoidCallback? onPressed;

    if (estrela >= int.parse(texto)) {
      icone = Icons.star;
      corIcone = Colors.yellow.withOpacity(0.9);
      onPressed = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Exercicios(texto)),
        );
      };
    } else {
      icone = Icons.lock;
      corIcone = Colors.white24.withOpacity(0.5);
      onPressed = null; // Desativa o botão
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      child: SizedBox(
        width: 30,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              texto,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              icone,
              color: corIcone,
            ),
          ],
        ),
      ),
    );
  }
}
