import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import '../Model/Servidor.dart';
part 'mobx.g.dart';

class Mobx = ControllerBase with _$Mobx;

abstract class ControllerBase with Store {

  @observable
  ObservableList servidores = [

  ].asObservable();

  @computed
  List<dynamic> get listaFiltrada {
    recuperarServidorFiltrados(nome, setor);
    return servidores;
  }

  @action
  recuperarServidorFiltrados(String nome, String setor) async {

    FirebaseFirestore db = FirebaseFirestore.instance;

    servidores.clear();

    // pesquisa com nome e setor
    if(nome != '' && setor != ''){
      await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: nome)
          .where('setor', isEqualTo: setor).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              servidores.add(servidor);
            }
            return servidores;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome != '' && setor == ''){
      //pesquisa apenas nome - N
      print('Recuperação com filtragem');
      print('nome');
      await db.collection('qq_pesquisa')
          .where('nome', isEqualTo: nome).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              servidores.add(servidor);
            }
            return servidores;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if(nome == '' && setor != ''){
      //pesquisa apenas setor - S
      print('Recuperação com filtragem');
      print('setor');
      await db.collection('qq_pesquisa')
          .where('setor', isEqualTo: setor).get().then(
              (querySnapshot){
            for (var docSnapshot in querySnapshot.docs){
              print('${docSnapshot.data()}');
              //servidores1.add(docSnapshot.data());
              Servidor servidor = Servidor();
              servidor.id = docSnapshot.data()['id'];
              servidor.nome = docSnapshot.data()['nome'];
              servidor.setor = docSnapshot.data()['setor'];
              servidor.telefone = docSnapshot.data()['telefone'];
              servidor.endereco = docSnapshot.data()['endereco'];
              servidores.add(servidor);
            }
            return servidores;
          },
          onError: (e) => print("Error completing: $e")
      );
    } else if ((nome != '' || setor != '') && servidores.length == 0) {
      return servidores;
    } else {
      recuperarServidores();
    }
  }

  @action
  recuperarServidores() async {

    print('Recuperação sem filtragem');
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('qq_pesquisa').get().then(
            (querySnapshot){
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs){
            print('${docSnapshot.data()}');
            //servidores1.add(docSnapshot.data());
            Servidor servidor = Servidor();
            servidor.id = docSnapshot.data()['id'];
            servidor.nome = docSnapshot.data()['nome'];
            servidor.setor = docSnapshot.data()['setor'];
            servidor.telefone = docSnapshot.data()['telefone'];
            servidor.endereco = docSnapshot.data()['endereco'];
            servidores.add(servidor);
          }
          return servidores;
        },
        onError: (e) => print("Error completing: $e")
    );

  }

  @action
  setLimparFiltro(){
    nome = '';
    setor = '';
    recuperarServidorFiltrados(nome, setor);
  }

  @observable
  String nome = '';
  @action
  setNome(String value) {
    nome = value;
    recuperarServidorFiltrados(nome, setor);
  }

  @observable
  String setor = '';
  @action
  setSetor(String value) {
    setor = value;
    recuperarServidorFiltrados(nome, setor);
  }

}

