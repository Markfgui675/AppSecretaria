class Usuario {
  String? _idUsuario;
  String? _nome;
  String? _email;
  String? _senha;
  String _profilepic = '';

  Usuario();

  Map<String, dynamic> toMap(){

    Map<String, dynamic> map = {
      'id':this.idUsuario,
      'nome': this.nome,
      'email': this.email,
      'profilepic':this._profilepic
    };

    return map;
  }


  String get profilepic => _profilepic;

  set profilepic(String value) {
    _profilepic = value;
  }

  String get senha => _senha!;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email!;

  set email(String value) {
    _email = value;
  }

  String get nome => _nome!;

  set nome(String value) {
    _nome = value;
  }

  String get idUsuario => _idUsuario!;

  set idUsuario(String value) {
    _idUsuario = value;
  }
}