import 'package:flutter/material.dart';
import '../telas/exercicios.dart';

class BotaoNiveis extends StatelessWidget {
  String texto = "";
  final estrela;

  //;

  BotaoNiveis(this.texto, this.estrela);

  @override
  Widget build(BuildContext context) {
    IconData icone;

    if (estrela >= int.parse(texto)) {
      icone = Icons.star;
    } else {
      icone = Icons.lock;
    }

    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Exercicios(texto)),
        );
      },
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
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              icone,
              color: Colors.yellowAccent.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }
}
