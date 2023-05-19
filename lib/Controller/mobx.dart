import 'package:app_secretaria_flutter/Model/client.dart';
import 'package:mobx/mobx.dart';
part 'mobx.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{

  var cliente = Client();

  String validateName(){
    if(cliente.name == null || cliente.name!.isEmpty){
      return "este campo é obrigatório";
    }

    return '';
  }

}
