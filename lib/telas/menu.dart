import 'package:flutter/material.dart';
import '../widgets/botaoNiveis.dart';

class Menu extends StatelessWidget {
  int linhaUm = 7;
  int linhaDois = 7;
  int linhaTres = 7;
  int linhaQuatro = 2;
  int cont = 0;
  String textoTeste = "--------";

  Menu(this.textoTeste);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              Text(textoTeste),
              _buildRow(linhaUm),
              SizedBox(height: 10),
              _buildRow(linhaDois),
              SizedBox(height: 10),
              _buildRow(linhaTres),
              SizedBox(height: 10),
              _buildRow(linhaQuatro),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int quantidade) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza horizontalmente
      children: List.generate(
        quantidade,
            (index) {
          cont++; // Atualiza o contador de botões
          return Container(
            child: BotaoNiveis(cont.toString()), // Passa o número do botão como texto
          );
        },
      ),
    );
  }
}
