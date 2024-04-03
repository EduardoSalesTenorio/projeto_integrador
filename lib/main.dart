import 'package:flutter/material.dart';
import 'telas/home.dart';
import 'telas/menu.dart';
import 'package:flutter/services.dart';

void main() {
  // Orientação da tela
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  runApp(new App());
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
      },
    );
  }
}
