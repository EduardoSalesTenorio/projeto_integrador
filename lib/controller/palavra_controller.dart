import 'package:sqflite/sqflite.dart';
import 'conexao.dart';
import '/model/palavra_model.dart';

class PalavraController extends Conexao {
  // Método para inserir uma palavra no banco de dados
  Future<int> inserir(PalavraModel model) async {
    try {
      final Database db = await Conexao().conect();
      final valor = await db.insert(
        "Palavras",
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return valor;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  // Método para deletar uma palavra do banco de dados
  Future<int> deletar(int id) async {
    try {
      final Database db = await Conexao().conect();
      final valor = await db.delete(
        "Palavras",
        where: "PalavraID = ?",
        whereArgs: [id],
      );
      return valor;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  // Método para atualizar uma palavra no banco de dados
  Future<int> atualizar(PalavraModel model) async {
    try {
      final Database db = await Conexao().conect();
      final valor = await db.update(
        "Palavras",
        model.toMap(),
        where: "PalavraID = ?",
        whereArgs: [model.id],
      );
      return valor;
    } catch (e) {
      print("Erro: $e");
      return -1;
    }
  }

  // Método para obter todas as palavras do banco de dados
  Future<List<PalavraModel>> getPalavras() async {
    try {
      final Database db = await Conexao().conect();
      final List<Map<String, dynamic>> maps = await db.query("Palavras");
      return List.generate(maps.length, (index) {
        return PalavraModel(
          id: maps[index]['PalavraID'],
          palavra: maps[index]['Palavra'],
          nivelDificuldade: maps[index]['NivelDificuldade'],
          categoriaID: maps[index]['CategoriaID'],
          status: maps[index]['Status'] == 1,
          ordem: maps[index]['Ordem'],
        );
      });
    } catch (e) {
      print("Erro: $e");
      return [];
    }
  }

  // Método para contar palavras por categoria e status
  Future<Map<String, int>> countPalavrasByCategoria(String categoria) async {
    try {
      final Database db = await Conexao().conect();

      // Contagem total de palavras na categoria
      final List<Map<String, dynamic>> totalResult = await db.rawQuery('''
        SELECT COUNT(*) AS total
        FROM Palavras
        WHERE CategoriaID IN (
          SELECT CategoriaID
          FROM Categorias
          WHERE NomeCategoria = ?
        )
      ''', [categoria]);

      // Contagem de palavras na categoria com status true
      final List<Map<String, dynamic>> trueStatusResult = await db.rawQuery('''
        SELECT COUNT(*) AS total
        FROM Palavras
        WHERE CategoriaID IN (
          SELECT CategoriaID
          FROM Categorias
          WHERE NomeCategoria = ?
        ) AND Status = 1
      ''', [categoria]);

      return {
        "total": totalResult.first['total'] as int,
        "trueStatus": trueStatusResult.first['total'] as int,
      };
    } catch (e) {
      print("Erro: $e");
      return {
        "total": 0,
        "trueStatus": 0,
      };
    }
  }
}
