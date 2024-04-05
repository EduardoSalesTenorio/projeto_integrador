import 'package:flutter/material.dart';
import '../widgets/botaoNiveis.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
        fit: BoxFit.cover,
      )),
      padding: EdgeInsets.all(30),
      child: Expanded(
        child: SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: Column(
          children: [
            Row(
              children: [
                BotaoNiveis(),
                BotaoNiveis(),
                BotaoNiveis(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                BotaoNiveis(),
                BotaoNiveis(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                BotaoNiveis(),
                BotaoNiveis(),
              ],
            ),
          ],
        )),
      ),
    ));
  }
}
