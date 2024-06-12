import 'package:flutter/material.dart';
import '../widgets/botaoNiveis.dart';
import '/controller/palavra_controller.dart';

class Menu extends StatefulWidget {
  final String nomeCategoria;

  Menu(this.nomeCategoria);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int cont = 0;
  int totalPalavras = 0;
  int totalPalavrasComTrue = 0;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final dados = await PalavraController()
        .countPalavrasByCategoria(widget.nomeCategoria);
    setState(() {
      totalPalavras = dados['total'] ?? 0;
      totalPalavrasComTrue = dados['trueStatus'] ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int numeroDeLinhas = (totalPalavras / 7).ceil();

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagens/cenario/CenarioPronto.jpg"),
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
                    _buildRow(totalPalavras),
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
                child: BotaoNiveis(cont.toString(), totalPalavrasComTrue, totalPalavras),
              ),
            );
          } else {
            return SizedBox(
                width: 30); // Espaço em branco para manter a disposição
          }
        },
      ),
    );
  }
}
