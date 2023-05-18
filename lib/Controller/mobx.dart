import 'package:mobx/mobx.dart';
part 'mobx.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

  @observable
  String nome = '';

  @observable
  String sobrenome = '';

  @computed
  String get nomecompleto => "$nome $sobrenome";

  @action
  changeName(String newName){
    nome = newName;
  }

  @action
  changeLastname(String newName){
    sobrenome = newName;
  }

}
