import 'package:sqflite/sqflite.dart';
import '/controller/categoria_controller.dart';
import '/controller/palavra_controller.dart';
import '/model/categoria_model.dart';
import '/model/palavra_model.dart';
import '../controller/conexao.dart';

class Dados {
  final CategoriaController categoriaController = CategoriaController();
  final PalavraController palavraController = PalavraController();

  Future<void> seed() async {
    try {
      // Inserir Categorias
      int animaisId = await categoriaController
          .inserir(CategoriaModel(nomeCategoria: "Animais"));
      int frutasId = await categoriaController
          .inserir(CategoriaModel(nomeCategoria: "Comidas"));
      int naturezaId = await categoriaController
          .inserir(CategoriaModel(nomeCategoria: "Natureza"));
      int objetosId = await categoriaController
          .inserir(CategoriaModel(nomeCategoria: "Objetos"));
      int brinquedosId = await categoriaController
          .inserir(CategoriaModel(nomeCategoria: "Brinquedos"));
      int pessoasId = await categoriaController
          .inserir(CategoriaModel(nomeCategoria: "Pessoas"));

      // Popular o banco de dados com palavras de exemplo
      await popularBancoDeDados(
          animaisId, frutasId, naturezaId, objetosId, brinquedosId, pessoasId);

      print("Banco de dados populado com sucesso.");
    } catch (e) {
      print("Erro ao popular o banco de dados: $e");
    }
  }

  Future<void> popularBancoDeDados(int animaisId, int frutasId,
      int naturezaId, int objetosId, int brinquedosId, int pessoasId) async {
    try {
      final Database db = await Conexao().conect();

      // Exemplo de palavras
      List<PalavraModel> palavras = [
        PalavraModel(
          palavra: "BO_I",
          nivelDificuldade: 1,
          categoriaID: animaisId,
          status: true,
          ordem: 1,
          caminhoImagem: '"assets/imagens/libras/animais/imagens/Boi.png"',
          caminhoVideo: '"assets/imagens/libras/animais/videos/boi.mp4"',
        ),
        PalavraModel(
          palavra: "CO_BRA",
          nivelDificuldade: 1,
          categoriaID: animaisId,
          status: false,
          ordem: 3,
          caminhoImagem: '"assets/imagens/libras/animais/imagens/Cobra.png"',
          caminhoVideo: '"assets/imagens/libras/animais/videos/cobra.mp4"',
        ),
        PalavraModel(
          palavra: "fo_ca",
          nivelDificuldade: 1,
          categoriaID: animaisId,
          status: false,
          ordem: 4,
          caminhoImagem: '"assets/imagens/libras/animais/imagens/Foca.png"',
          caminhoVideo: '"assets/imagens/libras/animais/videos/foca.mp4"',
        ),
        PalavraModel(
          palavra: "GA_TO",
          nivelDificuldade: 1,
          categoriaID: animaisId,
          status: false,
          ordem: 2,
          caminhoImagem: '"assets/imagens/libras/animais/imagens/Gato.png"',
          caminhoVideo: '"assets/imagens/libras/animais/videos/gato.mp4"',
        ),
        PalavraModel(
          palavra: "MOS_CA",
          nivelDificuldade: 1,
          categoriaID: animaisId,
          status: false,
          ordem: 2,
          caminhoImagem: '"assets/imagens/libras/animais/imagens/Mosca.png"',
          caminhoVideo: '"assets/imagens/libras/animais/videos/mosca.mp4"',
        ),
        PalavraModel(
          palavra: "A_RA_NHA",
          nivelDificuldade: 1,
          categoriaID: animaisId,
          status: false,
          ordem: 2,
          caminhoImagem: '"assets/imagens/libras/animais/imagens/Aranha.png"',
          caminhoVideo: '"assets/imagens/libras/animais/videos/aranha.mp4"',
        ),

      ];

      // Inserir as palavras no banco de dados
      for (var palavra in palavras) {
        await palavraController.inserir(palavra);
      }

      print("Palavras inseridas com sucesso.");
    } catch (e) {
      print("Erro ao inserir palavras: $e");
    }
  }
}

// Seu método seed() pode ser chamado no main() ou onde for apropriado no seu aplicativo
void main() async {
  Dados dados = Dados();
  await dados.seed();
}
