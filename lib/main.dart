import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controller/conexao.dart';
import 'controller/palavra_controller.dart';
import 'telas/home.dart';
import 'telas/menu.dart';
import 'telas/exercicios.dart';
import 'popular/dados.dart'; // Importar a classe Dados

void main() async {
  // Define a orientação da tela para paisagem
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  // Inicializa o banco de dados
  final conexao = Conexao();
  await conexao.conect();

  // Popula o banco de dados
  final dados = Dados();
  await dados.seed();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'menu': (context) => Menu("Animais"), // Passar o nome da categoria desejada
        'exercicios': (context) => Exercicios(0,0,""),
      },
    );
  }
}
