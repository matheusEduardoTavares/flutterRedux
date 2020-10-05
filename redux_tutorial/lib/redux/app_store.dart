//A store é o local onde está todo o estado da aplicação, e
//de onde iremos consumir.
import 'package:redux/redux.dart';
import 'app_reducer.dart';
import 'app_state.dart';

//O Store vem do pacote do redux e ele deve ser tipado, no
//caso o tipo dele será o AppState que representa o estado da
//aplicação, o store é só um local para poder recuperar esse
//estado que está no AppState.
//De parâmetro passamos uma função que retorna um estado 
//da aplicação. Precisa de uma função que quando é disparado
//uma ação, é pego o estado atual e a ação, passa para essa
//função que precisamos e essa função é responsável por 
//retornar o novo estado da aplicação. Portanto essa função
//ocorre no reducer, é o appReducer.
//Esse é o único parâmetro obrigatório, mas há vários outros
//parâmetros que podem ser passados.
//O segundo parâmetro é o estado inicial da aplicação.
Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initialState()
);