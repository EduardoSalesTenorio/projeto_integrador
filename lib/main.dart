import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'telas/home.dart';
import 'telas/menu.dart';
import 'telas/exercicios.dart';

void main() {
  // Define a orientação da tela para paisagem
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'telas/home',
      routes: {
        'telas/home': (context) => Home(),
        'telas/menu': (context) => Menu(),
        'telas/exercicios': (context) => Exercicios(),
      },
    );
  }
}
