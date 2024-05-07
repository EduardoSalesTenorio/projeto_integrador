import 'package:flutter/material.dart';
import '../widgets/botaoNiveis.dart';

class Menu extends StatelessWidget {
  int cont = 0;
  int estrelas = 8;
  String textoTeste = "--------";

  Menu(this.textoTeste);

  @override
  Widget build(BuildContext context) {
    // Define a quantidade total de botões
    int quantidadeTotal = 25;

    // Calcula o número de linhas necessárias para exibir os botões
    int numeroDeLinhas = (quantidadeTotal / 7).ceil();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Define a cor de fundo como transparente
        elevation: 0, // Remove a sombra da AppBar
        title: Text("Menu"), // Adicione um título para o AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Use o ícone de seta para trás
          onPressed: () {
            // Navegue de volta para a tela anterior usando Navigator.pop(context)
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              for (int i = 0; i < numeroDeLinhas; i++)
                Column(
                  children: [
                    _buildRow(quantidadeTotal),
                    SizedBox(height: 5), // Espaço vertical entre as linhas
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(int quantidadeTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centraliza horizontalmente
      children: List.generate(
        7, // Máximo de 7 botões por linha
            (index) {
          cont++; // Atualiza o contador de botões
          if (cont <= quantidadeTotal) {
            return Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 5), // Espaço entre os botões
              child: Container(
                child: BotaoNiveis(cont.toString(), estrelas),
              ),
            );
          } else {
            return SizedBox(width: 30); // Espaço em branco para manter a disposição
          }
        },
      ),
    );
  }
}
