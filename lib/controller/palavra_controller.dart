import 'package:sqflite/sqflite.dart';
import 'conexao.dart';
import '/model/palavra_model.dart';

class PalavraController extends Conexao {

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

  Future<PalavraModel?> getPalavraById(int id) async {
    try {
      final Database db = await Conexao().conect();
      final List<Map<String, dynamic>> maps = await db.query(
        "Palavras",
        where: "PalavraID = ?",
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        return PalavraModel(
          id: maps[0]['PalavraID'],
          palavra: maps[0]['Palavra'],
          nivelDificuldade: maps[0]['NivelDificuldade'],
          categoriaID: maps[0]['CategoriaID'],
          status: maps[0]['Status'] == 1,
          ordem: maps[0]['Ordem'],
        );
      }
      return null;
    } catch (e) {
      print("Erro: $e");
      return null;
    }
  }

  Future<List<PalavraModel>> getPalavrasByCategoria(int categoriaID) async {
    try {
      final Database db = await Conexao().conect();
      final List<Map<String, dynamic>> maps = await db.query(
        "Palavras",
        where: "CategoriaID = ?",
        whereArgs: [categoriaID],
        orderBy: "Ordem ASC",
      );

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
}
