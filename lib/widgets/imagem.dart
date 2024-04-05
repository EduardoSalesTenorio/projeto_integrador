import 'package:flutter/material.dart';

class Imagem extends StatelessWidget {
  Imagem(this.texto);

  String texto = "";

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      texto,
      width: 200,
      height: 200,
    );
  }
}
