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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(

                  children: [
                    Text("Estamos trabalhando"),

                    BotaoMenu(),

                  ],
                ),


              ]
          )

        ),
      ),
    );
  }
}