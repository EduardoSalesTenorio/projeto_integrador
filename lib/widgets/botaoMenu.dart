import 'package:flutter/material.dart';


class BotaoMenu extends StatelessWidget{

  BotaoMenu();


  Widget build(BuildContext context){
    return               OutlinedButton(onPressed: (){}, child: Text("Testando Botão"),
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(20)
        )//Fim estilo
    );
  }


}