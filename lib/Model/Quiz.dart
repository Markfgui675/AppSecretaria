class Quiz{
  String? _titulo;
  String? _pergunta;
  String? _q1;
  String? _q2;
  String? _q3;
  String? _q4;

  Quiz();

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {
      'titulo':this.titulo,
      'pergunta':this.pergunta,
      'q1':this.q1,
      'q2':this.q2,
      'q3':this.q3,
      'q4':this.q4
    };

    return map;
  }

  String get q4 => _q4!;

  set q4(String value) {
    _q4 = value;
  }

  String get q3 => _q3!;

  set q3(String value) {
    _q3 = value;
  }

  String get q2 => _q2!;

  set q2(String value) {
    _q2 = value;
  }

  String get q1 => _q1!;

  set q1(String value) {
    _q1 = value;
  }

  String get pergunta => _pergunta!;

  set pergunta(String value) {
    _pergunta = value;
  }

  String get titulo => _titulo!;

  set titulo(String value) {
    _titulo = value;
  }


}