import 'package:aula4/redux/products_state/products_action.dart';
import 'package:aula4/redux/products_state/products_reducer.dart';
import 'package:redux/redux.dart';
import 'app_actions.dart';
import 'app_state.dart';

///O [TypedReducer] é uma classe que recebe um estado e uma
///ação específica e retorna um novo estado com base no tipo
///de ação que entrou, assim para cada state que temos um 
///reducer, conseguimos pegar action por action específica 
///daquele reducer e jogar para funções. Para tal, basta usarmos
///o método [combineReducers] cujo generic é o estado que deseja atualizar,
///e o valor é uma lista de reducers. Aí para cada action é 
///só criar um [TypedReducer] que tem dois valores de generic,
///o estado que deseja atualizar e a action referente, e como valor dele 
///passamos uma função que recebe o estado atual e a action 
///correspondente, e assim faz o que é necessário, e com isso
///evitamos esses vários ifs. E ele irá substituir o que 
///fazíamos na mão a função do reducer.
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, IncrementCounter>(_incrementReducer),
  TypedReducer<AppState, DecrementCounter>(_decrementReducer),
  TypedReducer<AppState, ProductsAction>(_productsReducer),
]);

AppState _incrementReducer(AppState state, IncrementCounter action) {
  return state.copyWith(
    counter: state.counter + 1,
  );
}

AppState _decrementReducer(AppState state, DecrementCounter action) {
  return state.copyWith(
    counter: state.counter - 1,
  );
}

AppState _productsReducer(AppState state, ProductsAction action) {
  final newProductsState = productsReducer(
    state.productsState, 
    action
  );
  return state.copyWith(
    productsState: newProductsState,
  );
}