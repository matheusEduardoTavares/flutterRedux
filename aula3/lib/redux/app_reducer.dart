import 'package:aula3/redux/products_state/products_action.dart';
import 'package:aula3/redux/products_state/products_reducer.dart';

import 'app_actions.dart';
import 'app_state.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IncrementCounter){
    return state.copyWith(
      counter: state.counter + 1,
    );
  }
  else if (action is DecrementCounter) {
    return state.copyWith(
      counter: state.counter - 1,
    );
  }
  else if (action is ProductsAction) {
    final newProductsState = productsReducer(
      state.productsState, 
      action
    );
    return state.copyWith(
      productsState: newProductsState,
    );
  }
  return state;
}