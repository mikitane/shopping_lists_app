import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:shopping_lists_app/data/models/base_model_interface.dart';
import 'package:shopping_lists_app/data/models/product/product_model.dart';

part 'shopping_list_model.freezed.dart';
part 'shopping_list_model.g.dart';

@freezed
abstract class ShoppingListModel with _$ShoppingListModel implements BaseModelInterface {
  const ShoppingListModel._();

  @HiveType(typeId: 0, adapterName: 'ShoppingListModelAdapter')
  factory ShoppingListModel(
          {@HiveField(0) required String id,
          @HiveField(1) required String name,
          @HiveField(2) required DateTime lastModified,
          @HiveField(3) @Default([]) List<ProductModel> products}) =
      _ShoppingListModel;

  List<ProductModel> get visibleProducts => products.where((p) => !p.removed).toList();
}
