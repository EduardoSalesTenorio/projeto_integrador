import 'package:flutter/material.dart';
import '../widgets/botaoNiveis.dart';
import '../widgets/botaoMenu.dart';

class Exercicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Junte as sílabas",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
                SizedBox(height: 15),
                Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent.withOpacity(0.5),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent.withOpacity(0.5),
                            ),
                            SizedBox(height: 10),
                            Text(
                              " _ _ ",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            BotaoMenu("Sa", Color.fromRGBO(65, 177, 79, 1)),
                            SizedBox(height: 10),
                            BotaoMenu("Ca", Color.fromRGBO(147, 35, 133, 1)),
                            SizedBox(height: 30),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
