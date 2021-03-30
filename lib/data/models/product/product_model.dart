import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:shopping_lists_app/data/models/base_model_interface.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel implements BaseModelInterface {
  @HiveType(typeId: 1, adapterName: 'ProductModelAdapter')
  factory ProductModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) String? amount,
    @HiveField(3) required bool done,
    @HiveField(4) @Default(false) bool removed,
  }) = _ProductModel;

    factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
