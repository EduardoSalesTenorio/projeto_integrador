import '/controller/categoria_controller.dart';
import '/controller/palavra_controller.dart';
import '/model/categoria_model.dart';
import '/model/palavra_model.dart';

class Dados {
  final CategoriaController categoriaController = CategoriaController();
  final PalavraController palavraController = PalavraController();

  Future<void> seed() async {
    // Inserir Categorias
    int transporteId = await categoriaController.inserir(CategoriaModel(nomeCategoria: "Meios de Transporte"));
    int frutasId = await categoriaController.inserir(CategoriaModel(nomeCategoria: "Frutas"));

    // Inserir Palavras
    await palavraController.inserir(PalavraModel(palavra: "Avião", nivelDificuldade: 1, categoriaID: transporteId, ordem: 1));
    await palavraController.inserir(PalavraModel(palavra: "Carro", nivelDificuldade: 1, categoriaID: transporteId, ordem: 2));
    await palavraController.inserir(PalavraModel(palavra: "Maçã", nivelDificuldade: 1, categoriaID: frutasId, ordem: 1));
    await palavraController.inserir(PalavraModel(palavra: "Banana", nivelDificuldade: 1, categoriaID: frutasId, ordem: 2));
    await palavraController.inserir(PalavraModel(palavra: "Abacaxi", nivelDificuldade: 1, categoriaID: frutasId, ordem: 3));
  }
}
