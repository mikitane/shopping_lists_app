import 'package:hive/hive.dart';
import 'package:shopping_lists_app/data/models/base_model_interface.dart';
import 'package:uuid/uuid.dart';

part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject implements BaseModelInterface {
  ProductModel(
      {required this.name,
      required this.amount,
      required this.done,
      required this.shoppingListId,
      id})
      : this.id = id ?? Uuid().v4();

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String amount;

  @HiveField(3)
  bool done;

  @HiveField(4)
  String shoppingListId;
}
