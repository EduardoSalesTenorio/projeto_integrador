import 'package:flutter/material.dart';
import '../widgets/botaoExercicios.dart';
import '../widgets/imagem.dart';
import '../widgets/VideoPlayerWidget.dart';

class Exercicios extends StatefulWidget {
  final String textoTeste;

  Exercicios(this.textoTeste);

  @override
  State<Exercicios> createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  List<String> respostas = ['ra', 'A', 'ra'];
  String respostaUsuario = "_______";
  int conteBotoes = 0;

  void _resposta(String texto) {
    setState(() {
      if (respostaUsuario == "_______") {
        respostaUsuario = texto; // Atualiza o texto da resposta do usuário
      } else {
        respostaUsuario = respostaUsuario + texto;
      }
    });

    _conteBotoes();
  }

  void _conteBotoes() {
    this.conteBotoes++;
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
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.textoTeste), // Corrigindo o acesso ao textoTeste
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
                  SizedBox(height: 50)
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
                                    () => _resposta(respostas[
                                        index]), // Corrige a assinatura da função de callback
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
