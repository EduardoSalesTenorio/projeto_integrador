import 'package:flutter/material.dart';
import '../widgets/botaoNiveis.dart';

class Menu extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration (
            image: DecorationImage(
              image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
              fit: BoxFit.cover,
            )
        ),

        padding: EdgeInsets.all(30),
        
        child: Row(
          children: [
            Text("Testando"),

            BotaoNiveis(),
            SizedBox(width: 10,),
            BotaoNiveis(),


          ],
        ),
        
        
      ),
      
      
      
    );
  }


}