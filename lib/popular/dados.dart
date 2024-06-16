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
      await popularBancoDeDados(animaisId, frutasId, naturezaId, objetosId, brinquedosId, pessoasId);

      print("Banco de dados populado com sucesso.");
    } catch (e) {
      print("Erro ao popular o banco de dados: $e");
    }
  }

  Future<void> popularBancoDeDados(int transporteId, int frutasId, int naturezaId, int objetosId, int brinquedosId, int pessoasId) async {
    try {
      final Database db = await Conexao().conect();

      // Exemplo de palavras
      List<PalavraModel> palavras = [

        PalavraModel(
          palavra: "MA_ÇÃ", nivelDificuldade: 1, categoriaID: frutasId, status: true, ordem: 1,
        ),

        PalavraModel(
          palavra: "A_BA_CA_TE", nivelDificuldade: 1, categoriaID: frutasId, status: false, ordem: 2,
        ),

        PalavraModel(
          palavra: "JA_CA", nivelDificuldade: 1, categoriaID: frutasId, status: false, ordem: 3,
        ),

        PalavraModel(
          palavra: "CA_JU", nivelDificuldade: 1, categoriaID: frutasId, status: false, ordem: 4,
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
