class ProductsAction{}

class LoadProductsAction extends ProductsAction {}
class AddProductsAction extends ProductsAction {
  final String product;
  AddProductsAction(this.product);
}
class RemoveProductsAction extends ProductsAction {
  RemoveProductsAction({
    required this.product
  });

  final String product;
}