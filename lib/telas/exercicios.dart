import 'package:flutter/material.dart';
import '../widgets/botaoExercicios.dart';
import '../widgets/imagem.dart';
import '../widgets/VideoPlayerWidget.dart';

class Exercicios extends StatefulWidget {
  @override
  State<Exercicios> createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  List<String> respostas = ['ra', 'A', 'ra'];
  String respostaUsuario = "_______";

  void _resposta(String texto) {
    setState(() {



      respostaUsuario = texto; // Atualiza o texto da resposta do usuário
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
            fit: BoxFit.cover,
          ),
        ),
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
                  SizedBox(height: 100)
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                            child: Column(children: [
                              VideoPlayerWidget(
                                  videoPath:
                                  'assets/imagens/videos/_Arara.mp4'),
                            ]),
                          )),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Imagem('assets/imagens/Arara.png'),
                          SizedBox(height: 10),
                          Text(
                            respostaUsuario,
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                      SizedBox(width: 20),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: respostas.length,
                                itemBuilder: (context, index) {
                                  return BotaoExercicios(
                                    respostas[index],
                                    Color.fromRGBO(65, 177, 79, 1),
                                        () => _resposta(respostas[index]), // Corrige a assinatura da função de callback
                                  );
                                },
                              ),
                              SizedBox(height: 30),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
