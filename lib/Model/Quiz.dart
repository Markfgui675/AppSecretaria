class Quiz{
  String? _id_quiz;
  String? _titulo;
  List? _info;

  Quiz();

  List get info => _info!;

  set info(List value) {
    _info = value;
  }

  String get titulo => _titulo!;

  set titulo(String value) {
    _titulo = value;
  }

  String get id_quiz => _id_quiz!;

  set id_quiz(String value) {
    _id_quiz = value;
  }
}