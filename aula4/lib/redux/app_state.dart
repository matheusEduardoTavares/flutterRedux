import 'package:aula4/redux/products_state/products_state.dart';

class AppState {
  final int counter;
  final ProductsState productsState;

  AppState({
    required this.counter,
    required this.productsState,
  });

  factory AppState.initialState() {
    return AppState(
      counter: 0,
      productsState: ProductsState.initial(),
    );
  }

  AppState copyWith({
    int? counter,
    ProductsState? productsState,
  }) {
    return AppState(
      counter: counter ?? this.counter,
      productsState: productsState ?? this.productsState,
    );
  }
}