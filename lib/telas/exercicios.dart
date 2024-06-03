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
  String perguntaBancoDados = "Eduardo_Sales_Tenorio";
  String respostaCerta = "";
  List<String> perguntas = [];
  String respostaUsuario = "_______";
  List<bool> visibilidadeBotoes = [];

  @override
  void initState() {
    super.initState();
    perguntas = perguntaBancoDados.split("_");
    perguntas.shuffle();
    respostaCerta = perguntaBancoDados.replaceAll("_", "");
    visibilidadeBotoes = List.filled(perguntas.length, true);
  }

  void _conferir() {
    String resposta = respostaUsuario.replaceAll(" ", "");
    if (resposta == respostaCerta) {
      // Lógica quando a resposta está correta
    } else {
      // Lógica quando a resposta está incorreta
    }
  }

  void _resposta(String texto) {
    setState(() {
      if (respostaUsuario == "_______") {
        respostaUsuario = texto;
      } else {
        respostaUsuario =
            '$respostaUsuario $texto'; // Adiciona um espaço entre as palavras
      }
    });
  }

  void _resetarQuestao() {
    setState(() {
      respostaUsuario = "_______";
      perguntas.shuffle();
      respostaCerta = perguntaBancoDados.replaceAll("_", "");
      visibilidadeBotoes = List.filled(perguntas.length, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imagens/cenario/CenarioPronto.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 5),
            //Frase de juntar as sílabas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Junte as sílabas",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            //Contém os componentes centralizados
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Video
                  Container(
                    child: Column(
                      children: [
                        //Videos
                        VideoPlayerWidget(
                          videoPath: 'assets/imagens/videos/_Arara.mp4',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 10),
                  //Imagem e resposta do usuário
                  Column(
                    children: [
                      Imagem('assets/imagens/Arara.png'),
                      SizedBox(height: 5),
                      //Resposta do Usuário
                      Container(
                        width: 150, // Define a largura do container
                        child: Text(
                          respostaUsuario,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      //Botões de resete e conferência
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          //Botão Resetar
                          OutlinedButton(
                            onPressed: _resetarQuestao,
                            child: Icon(Icons.refresh, color: Colors.white),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                          SizedBox(width: 10),

                          //Botão Conferir
                          OutlinedButton(
                            onPressed: _conferir,
                            child: Icon(Icons.check, color: Colors.white),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 20),

                  //Botões
                  Expanded(
                    child: Column(
                      children: List.generate(perguntas.length, (index) {
                        return Visibility(
                          visible: visibilidadeBotoes[index],
                          child: BotaoExercicios(
                            texto: perguntas[index],
                            onPressed: () {
                              setState(() {
                                _resposta(perguntas[index]);
                                visibilidadeBotoes[index] = false;
                              });
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
