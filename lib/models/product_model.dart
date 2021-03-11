import 'package:uuid/uuid.dart';

class ProductModel {
  ProductModel(
      {required this.name,
      required this.amount,
      required this.done,
      required this.shoppingListId,
      id})
      : this.id = id ?? Uuid().v4();

  String id;
  String name;
  String amount;
  bool done;
  String shoppingListId;
}
