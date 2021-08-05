class ProductsState {
  final List<String> products;

  ProductsState({
    required this.products,
  });

  factory ProductsState.initial() {
    return ProductsState(products: []);
  }

  ProductsState copyWith({
    List<String>? products,
  }) => ProductsState(
    products: products ?? this.products,
  );
}