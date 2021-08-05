import 'package:aula4/redux/products_state/products_action.dart';
import 'package:aula4/redux/products_state/products_state.dart';
import 'package:redux/redux.dart';

final productsReducer = combineReducers<ProductsState>([
  TypedReducer<ProductsState, AddProductsAction>(_addProductsAction),
  TypedReducer<ProductsState, RemoveProductsAction>(_removeProductsAction),
]);

ProductsState _addProductsAction(ProductsState state, AddProductsAction action) {
  return state.copyWith(
    products: [
      ...state.products,
      action.product,
    ],
  );
}

ProductsState _removeProductsAction(ProductsState state, RemoveProductsAction action) {
  final newListProducts = List<String>.from(state.products);
  newListProducts.removeWhere((element) => element == action.product);
  return state.copyWith(
    products: newListProducts,
  );
}