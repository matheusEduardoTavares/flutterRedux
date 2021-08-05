import 'package:aula3/redux/products_state/products_action.dart';
import 'package:aula3/redux/products_state/products_state.dart';

ProductsState productsReducer(ProductsState state, ProductsAction action) {
  if (action is AddProductsAction) {
    return state.copyWith(
      products: [
        ...state.products,
        action.product,
      ],
    );
  }
  else if (action is RemoveProductsAction) {
    final newListProducts = List<String>.from(state.products);
    newListProducts.removeWhere((element) => element == action.product);
    return state.copyWith(
      products: newListProducts,
    );
  }

  return state;
}