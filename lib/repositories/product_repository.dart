import 'dart:async';

import 'package:shopping_lists_app/models/product_model.dart';

class ProductRepository {
  // TODO: Use real stream from database
  StreamController<List<ProductModel>> productsStreamController = StreamController.broadcast();
  List<ProductModel> products = [
    ProductModel(name: 'Maito', amount: '2l', done: false, shoppingListId: '1'),
    ProductModel(name: 'Juusto', amount: '1kg', done: true, shoppingListId: '1'),
    ProductModel(name: 'Leipä', amount: '1 paketti', done: true, shoppingListId: '1'),
    ProductModel(name: 'Olutta', amount: 'paljon', done: true, shoppingListId: '2'),
    ProductModel(name: 'Sipsit', amount: '', done: false, shoppingListId: '2'),
    ProductModel(name: 'Limut', amount: '4l', done: false, shoppingListId: '2'),
    ProductModel(name: 'Nauloja', amount: '1kg', done: true, shoppingListId: '3'),
    ProductModel(name: 'Vasara', amount: '', done: true, shoppingListId: '3'),
  ];


  Stream<List<ProductModel>> getProductsStream() {
    return productsStreamController.stream;
  }

  void createProduct(ProductModel newProduct) {
    products.add(newProduct);
    productsStreamController.add(products);
  }

  void setProductDone(ProductModel product, bool done) {
    products.singleWhere((element) => element.id == product.id).done = done;
    productsStreamController.add(products);
  }
}