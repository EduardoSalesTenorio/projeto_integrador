import 'package:flutter/material.dart';

import '../widgets/botaoMenu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
              fit: BoxFit.cover,
            )),
            padding: EdgeInsets.all(30),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BotaoMenu("Animais", Color.fromRGBO(65, 177, 79, 1)),
                  SizedBox(height: 5),
                  BotaoMenu("Comidas", Color.fromRGBO(147, 35, 133, 1)),
                  SizedBox(height: 5),
                  BotaoMenu("Natureza", Color.fromRGBO(20, 126, 186, 1)),
                  SizedBox(height: 5),
                  BotaoMenu("Objetos", Color.fromRGBO(230, 126, 37, 1)),
                  SizedBox(height: 5),
                  BotaoMenu("Brinquedos", Color.fromRGBO(37, 68, 65, 1)),
                ],
              ),

              SizedBox(width: 20,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BotaoMenu("Pessoas", Color.fromRGBO(255, 193, 207, 1)),
                  SizedBox(height: 5),
                  BotaoMenu("Aleatorio", Color.fromRGBO(0, 108, 103, 1)),
                  SizedBox(height: 5),
                  BotaoMenu("Sobre", Color.fromRGBO(20, 126, 186, 1)),
                ],
              ),
            ])),
      ),
    );
  }
}
