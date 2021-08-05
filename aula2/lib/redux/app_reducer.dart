//É uma função que retorna o estado da aplicação.
//Essa função recebe o estado anterior e uma ação.
import 'app_actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  //Aqui retornamos um novo estado que será refletido em toda
  //a aplicação

  if (action is IncrementCounter){
    return state.copyWith(
      counter: state.counter + 1,
      counterX: state.counter * 2,
    );
  }

  if (action is DecrementCounter) {
    return state.copyWith(
      counter: state.counter - 1,
    );
  }
  //Se a ação que recebemos não for desejada para esse reducer,
  //simplesmente iremos retornar o estado atual, e não será
  //refletido nenhuma alteração em nossa tela.
  return state;
}