import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'telas/home.dart';
import 'telas/menu.dart';
import 'telas/exercicios.dart';

void main() {
  // Define a orientação da tela para paisagem
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(App());
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'menu': (context) => Menu(""),
        'exercicios': (context) => Exercicios(""),
      },
    );
  }
}
