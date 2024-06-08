class PalavraModel {
  int? id;
  String palavra;
  int nivelDificuldade;
  int categoriaID;
  bool status;
  int ordem;

  PalavraModel({
    this.id,
    required this.palavra,
    required this.nivelDificuldade,
    required this.categoriaID,
    this.status = false,
    required this.ordem,
  });

  Map<String, dynamic> toMap() {
    return {
      'PalavraID': id,
      'Palavra': palavra,
      'NivelDificuldade': nivelDificuldade,
      'CategoriaID': categoriaID,
      'Status': status ? 1 : 0,
      'Ordem': ordem,
    };
  }
}
