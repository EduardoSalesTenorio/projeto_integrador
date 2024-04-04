import 'package:flutter/material.dart';
import '../telas/menu.dart';


class BotaoMenu extends StatelessWidget {
  BotaoMenu(this.texto, this.cor);
  String texto = "";
  final Color cor;


  Widget build(BuildContext context) {

    return Container(

      width: 200,
      child:
        OutlinedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Menu()),
          );},
          child: Text(texto, style: TextStyle(fontSize: 25),),
          style: OutlinedButton.styleFrom(
            backgroundColor: cor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(20),
          ),
          //Fim estilo
        ),
    );
  }
}
