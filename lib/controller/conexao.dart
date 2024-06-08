import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static final String NOME_DATABASE = "libras.db";

  Future<Database> conect() async {
    return openDatabase(join(await getDatabasesPath(), NOME_DATABASE),
        version: 1, onCreate: (db, versao) {
      db.execute("""
        CREATE TABLE IF NOT EXISTS Categorias(
          CategoriaID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          NomeCategoria VARCHAR(50) NOT NULL
        )
        """);

      db.execute("""
        CREATE TABLE IF NOT EXISTS Palavras(
          PalavraID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          Palavra VARCHAR(50) NOT NULL,
          NivelDificuldade INTEGER NOT NULL,
          CategoriaID INTEGER,
          Status BOOLEAN,
          Ordem INTEGER NOT NULL,
          FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
        )
        """);
    });
  }
}
