class Servidor{

  String? _id;
  String? _nome;
  String? _setor;
  String? _telefone;
  String? _endereco;

  Servidor();

  String get id => _id!;

  set id(String value) {
    _id = value;
  }

  String get nome => _nome!;

  String get endereco => _endereco!;

  set endereco(String value) {
    _endereco = value;
  }

  String get telefone => _telefone!;

  set telefone(String value) {
    _telefone = value;
  }

  String get setor => _setor!;

  set setor(String value) {
    _setor = value;
  }

  set nome(String value) {
    _nome = value;
  }
}