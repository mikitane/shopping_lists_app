// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoppingListModelAdapter extends TypeAdapter<_$_ShoppingListModel> {
  @override
  final int typeId = 0;

  @override
  _$_ShoppingListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ShoppingListModel(
      id: fields[0] as String,
      name: fields[1] as String,
      lastModified: fields[2] as DateTime,
      products: (fields[3] as List).cast<ProductModel>(),
      removed: fields[4] as bool,
      needsSync: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ShoppingListModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastModified)
      ..writeByte(3)
      ..write(obj.products)
      ..writeByte(4)
      ..write(obj.removed)
      ..writeByte(5)
      ..write(obj.needsSync);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShoppingListModel _$_$_ShoppingListModelFromJson(Map<String, dynamic> json) {
  return _$_ShoppingListModel(
    id: json['id'] as String,
    name: json['name'] as String,
    lastModified: DateTime.parse(json['lastModified'] as String),
    products: (json['products'] as List<dynamic>?)
            ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    removed: json['removed'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_ShoppingListModelToJson(
        _$_ShoppingListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastModified': instance.lastModified.toIso8601String(),
      'products': instance.products,
      'removed': instance.removed,
    };
