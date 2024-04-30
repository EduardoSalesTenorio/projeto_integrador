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
  String perguntaBancoDados = "a_borboleta_pousa_na_flor";
  List<String> perguntas = [];
  String respostaUsuario = "_______";

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("imagens/cenario/CenarioPronto.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Column(
            children: [
              SizedBox(height: 5),

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
                ],
              ),
              SizedBox(height: 10),

              //Contem o componentes centralizados
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Video
                      Container(

                          child: Container(
                            child: Column(children: [
                              //Videos
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

                          //resposta do Usuario
                          Text(
                            respostaUsuario,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),

                          //Botoes de resete e converencia
                          Row(
                            children: [
                              OutlinedButton(
                                  onPressed: () {},
                                  child:
                                      Icon(Icons.refresh, color: Colors.white),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0.6))),
                              SizedBox(width: 10),
                              OutlinedButton(
                                  onPressed: () {},
                                  child: Icon(Icons.check, color: Colors.white),
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(0, 0, 0, 0.6)))
                            ],
                          )
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
                              SizedBox(height: 10),
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
