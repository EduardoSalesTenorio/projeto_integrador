import 'package:sqflite/sqflite.dart';
import 'conexao.dart';
import '/model/categoria_model.dart';

class CategoriaController extends Conexao {

  Future<int> inserir(CategoriaModel model) async {
    try {
      final Database db = await Conexao().conect();
      final valor = await db.insert(
        "Categorias",
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
        "Categorias",
        where: "CategoriaID = ?",
        whereArgs: [id],
      );
      return valor;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  Future<int> atualizar(CategoriaModel model) async {
    try {
      final Database db = await Conexao().conect();
      final valor = await db.update(
        "Categorias",
        model.toMap(),
        where: "CategoriaID = ?",
        whereArgs: [model.id],
      );
      return valor;
    } catch (e) {
      print("Erro: $e");
      return -1;
    }
  }

  Future<List<CategoriaModel>> getCategorias() async {
    try {
      final Database db = await Conexao().conect();
      final List<Map<String, dynamic>> maps = await db.query("Categorias");
      return List.generate(maps.length, (index) {
        return CategoriaModel(
          id: maps[index]['CategoriaID'],
          nomeCategoria: maps[index]['NomeCategoria'],
        );
      });
    } catch (e) {
      print("Erro: $e");
      return [];
    }
  }

  Future<CategoriaModel?> getCategoriaById(int id) async {
    try {
      final Database db = await Conexao().conect();
      final List<Map<String, dynamic>> maps = await db.query(
        "Categorias",
        where: "CategoriaID = ?",
        whereArgs: [id],
      );

      if (maps.isNotEmpty) {
        return CategoriaModel(
          id: maps[0]['CategoriaID'],
          nomeCategoria: maps[0]['NomeCategoria'],
        );
      }
      return null;
    } catch (e) {
      print("Erro: $e");
      return null;
    }
  }
}
