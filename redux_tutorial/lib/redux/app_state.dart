//Não é uma boa prática usar as dependências do flutter fora
//dos widgets, das camadas visuais, então aqui importamos o 
//meta não o material.dart.
// import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

//Aqui ficará o estado da aplicação.

//Devemos importar o pacote meta para poder usar o @required
//fora dos nossos widgets. Não é uma boa prática usar o required
//do flutter.
class AppState {
  final int counter;

  AppState({@required this.counter});

  //construtor que retorna o Estado inicial da aplicação:
  factory AppState.initialState() {
    return AppState(
      counter: 0
    );
  }

  //Função para atualizar o estado da aplicação:
  AppState copyWith({int counter}) {
    return AppState(
      counter: counter ?? this.counter
    );
  }
}