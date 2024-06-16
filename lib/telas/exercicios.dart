import 'package:flutter/material.dart';
import '../controller/palavra_controller.dart';
import '../model/palavra_model.dart';
import '../widgets/botaoExercicios.dart';
import '../widgets/imagem.dart';
import '../widgets/VideoPlayerWidget.dart';

class Exercicios extends StatefulWidget {
  final int numeroExercicio;
  final int numeroMaximo;
  final String nomeCategoria;

  Exercicios(this.numeroExercicio, this.numeroMaximo, this.nomeCategoria);

  @override
  State<Exercicios> createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  String respostaCerta = "";
  List<String> perguntas = [];
  String respostaUsuario = "_______";
  List<bool> visibilidadeBotoes = [];
  int cont = 0;

  List<String> palavras = [];
  final PalavraController _palavraController = PalavraController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    cont = widget.numeroExercicio - 1;
    _carregarPalavras();
  }

  Future<void> _carregarPalavras() async {
    try {
      List<PalavraModel> listaPalavras = await _palavraController
          .buscarPalavrasPorCategoria(widget.nomeCategoria);
      setState(() {
        palavras = listaPalavras.map((palavra) => palavra.palavra).toList();
        isLoading = false;
        if (palavras.isNotEmpty) {
          _carregarQuestao();
        }
      });
    } catch (e) {
      print('Erro ao carregar palavras: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _carregarQuestao() {
    if (palavras.isNotEmpty) {
      perguntas = palavras[cont].split("_");
      perguntas.shuffle();
      respostaCerta = palavras[cont].replaceAll("_", "");
      visibilidadeBotoes = List.filled(perguntas.length, true);
    }
  }

  void _conferir() {
    String resposta = respostaUsuario.replaceAll(" ", "");
    if (resposta == respostaCerta) {
      // Lógica quando a resposta está correta

      cont++;
    } else {
      // Lógica quando a resposta está incorreta

      _resetarQuestao();
    }
  }

  void _resposta(String texto) {
    setState(() {
      if (respostaUsuario == "_______") {
        respostaUsuario = texto;
      } else {
        respostaUsuario =
            '$respostaUsuario$texto'; // Adiciona um espaço entre as palavras
      }
    });
  }

  void _resetarQuestao() {
    setState(() {
      respostaUsuario = "_______";
      perguntas.shuffle();
      respostaCerta = palavras[cont % palavras.length].replaceAll("_", "");
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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : palavras.isEmpty
                ? Center(
                    child: Text(
                      "Nenhuma palavra encontrada.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(height: 5),
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
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  VideoPlayerWidget(
                                    videoPath:
                                        'assets/imagens/videos/_Arara.mp4',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              children: [
                                Imagem('assets/imagens/Arara.png'),
                                SizedBox(height: 5),
                                Container(
                                  width: 150,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                      onPressed: _resetarQuestao,
                                      child: Icon(Icons.refresh,
                                          color: Colors.white),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(0, 0, 0, 0.6),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    OutlinedButton(
                                      onPressed: _conferir,
                                      child: Icon(Icons.check,
                                          color: Colors.white),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(0, 0, 0, 0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children:
                                    List.generate(perguntas.length, (index) {
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
