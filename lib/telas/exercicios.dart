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
  String perguntaBancoDados = "A_ra_ra";
  List<String> perguntas = [];
  String respostaUsuario = "_______";
  int conteBotoes = 0;

  @override
  void initState() {
    //Quebra a String em vetor de acordo com o "split"
    //Isto faz automatico em palavras ou frases
    super.initState();
    perguntas = perguntaBancoDados.split("_");
    perguntas.shuffle();
  }

  void _resposta(String texto) {
    // Atualiza o texto da resposta do usuário quando vai apertando os botões
    setState(() {
      if (respostaUsuario == "_______") {
        respostaUsuario = texto;
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
              //Frase de juntar as silabas
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

              //Contem o componentes centralizados
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Video
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

                      //Imagem e resposta do usuario
                      Column(
                        children: [
                          Imagem('assets/imagens/Arara.png'),
                          SizedBox(height: 10),
                          Text(
                            respostaUsuario,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),

                      //Botoes
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: perguntas.length,
                                itemBuilder: (context, index) {
                                  return BotaoExercicios(
                                    perguntas[index],
                                    () => _resposta(perguntas[
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
