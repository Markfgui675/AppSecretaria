class Quiz{
  String? _idQuiz;
  String? _titulo;
  String? _pergunta;
  String? _q1;
  String? _q2;
  String? _q3;
  String? _q4;


  Quiz();

  String get idQuiz => _idQuiz!;

  set idQuiz(String value) {
    _idQuiz = value;
  }

  String get titulo => _titulo!;

  set titulo(String value) {
    _titulo = value;
  }

  String get pergunta => _pergunta!;

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

  set pergunta(String value) {
    _pergunta = value;
  }


}