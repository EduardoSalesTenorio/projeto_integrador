class CategoriaModel {
  int? id;
  String nomeCategoria;

  CategoriaModel({this.id, required this.nomeCategoria});

  Map<String, dynamic> toMap() {
    return {
      'CategoriaID': id,
      'NomeCategoria': nomeCategoria,
    };
  }
}
