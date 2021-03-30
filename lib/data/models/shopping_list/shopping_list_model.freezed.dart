// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShoppingListModel _$ShoppingListModelFromJson(Map<String, dynamic> json) {
  return _ShoppingListModel.fromJson(json);
}

/// @nodoc
class _$ShoppingListModelTearOff {
  const _$ShoppingListModelTearOff();

  _ShoppingListModel call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required DateTime lastModified,
      @HiveField(3) List<ProductModel> products = const [],
      @HiveField(4) bool removed = false,
      @HiveField(5) @JsonKey(ignore: true) bool needsSync = false}) {
    return _ShoppingListModel(
      id: id,
      name: name,
      lastModified: lastModified,
      products: products,
      removed: removed,
      needsSync: needsSync,
    );
  }

  ShoppingListModel fromJson(Map<String, Object> json) {
    return ShoppingListModel.fromJson(json);
  }
}

/// @nodoc
const $ShoppingListModel = _$ShoppingListModelTearOff();

/// @nodoc
mixin _$ShoppingListModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get lastModified => throw _privateConstructorUsedError;
  @HiveField(3)
  List<ProductModel> get products => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get removed => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(ignore: true)
  bool get needsSync => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingListModelCopyWith<ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListModelCopyWith<$Res> {
  factory $ShoppingListModelCopyWith(
          ShoppingListModel value, $Res Function(ShoppingListModel) then) =
      _$ShoppingListModelCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) DateTime lastModified,
      @HiveField(3) List<ProductModel> products,
      @HiveField(4) bool removed,
      @HiveField(5) @JsonKey(ignore: true) bool needsSync});
}

/// @nodoc
class _$ShoppingListModelCopyWithImpl<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  _$ShoppingListModelCopyWithImpl(this._value, this._then);

  final ShoppingListModel _value;
  // ignore: unused_field
  final $Res Function(ShoppingListModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastModified = freezed,
    Object? products = freezed,
    Object? removed = freezed,
    Object? needsSync = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      removed: removed == freezed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
      needsSync: needsSync == freezed
          ? _value.needsSync
          : needsSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ShoppingListModelCopyWith<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  factory _$ShoppingListModelCopyWith(
          _ShoppingListModel value, $Res Function(_ShoppingListModel) then) =
      __$ShoppingListModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) DateTime lastModified,
      @HiveField(3) List<ProductModel> products,
      @HiveField(4) bool removed,
      @HiveField(5) @JsonKey(ignore: true) bool needsSync});
}

/// @nodoc
class __$ShoppingListModelCopyWithImpl<$Res>
    extends _$ShoppingListModelCopyWithImpl<$Res>
    implements _$ShoppingListModelCopyWith<$Res> {
  __$ShoppingListModelCopyWithImpl(
      _ShoppingListModel _value, $Res Function(_ShoppingListModel) _then)
      : super(_value, (v) => _then(v as _ShoppingListModel));

  @override
  _ShoppingListModel get _value => super._value as _ShoppingListModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastModified = freezed,
    Object? products = freezed,
    Object? removed = freezed,
    Object? needsSync = freezed,
  }) {
    return _then(_ShoppingListModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: lastModified == freezed
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      removed: removed == freezed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
      needsSync: needsSync == freezed
          ? _value.needsSync
          : needsSync // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'ShoppingListModelAdapter')

/// @nodoc
class _$_ShoppingListModel extends _ShoppingListModel {
  _$_ShoppingListModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.lastModified,
      @HiveField(3) this.products = const [],
      @HiveField(4) this.removed = false,
      @HiveField(5) @JsonKey(ignore: true) this.needsSync = false})
      : super._();

  factory _$_ShoppingListModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ShoppingListModelFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final DateTime lastModified;
  @JsonKey(defaultValue: const [])
  @override
  @HiveField(3)
  final List<ProductModel> products;
  @JsonKey(defaultValue: false)
  @override
  @HiveField(4)
  final bool removed;
  @override
  @HiveField(5)
  @JsonKey(ignore: true)
  final bool needsSync;

  @override
  String toString() {
    return 'ShoppingListModel(id: $id, name: $name, lastModified: $lastModified, products: $products, removed: $removed, needsSync: $needsSync)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ShoppingListModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastModified, lastModified) ||
                const DeepCollectionEquality()
                    .equals(other.lastModified, lastModified)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.removed, removed) ||
                const DeepCollectionEquality()
                    .equals(other.removed, removed)) &&
            (identical(other.needsSync, needsSync) ||
                const DeepCollectionEquality()
                    .equals(other.needsSync, needsSync)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastModified) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(removed) ^
      const DeepCollectionEquality().hash(needsSync);

  @JsonKey(ignore: true)
  @override
  _$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith =>
      __$ShoppingListModelCopyWithImpl<_ShoppingListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ShoppingListModelToJson(this);
  }
}

abstract class _ShoppingListModel extends ShoppingListModel {
  factory _ShoppingListModel(
          {@HiveField(0) required String id,
          @HiveField(1) required String name,
          @HiveField(2) required DateTime lastModified,
          @HiveField(3) List<ProductModel> products,
          @HiveField(4) bool removed,
          @HiveField(5) @JsonKey(ignore: true) bool needsSync}) =
      _$_ShoppingListModel;
  _ShoppingListModel._() : super._();

  factory _ShoppingListModel.fromJson(Map<String, dynamic> json) =
      _$_ShoppingListModel.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  DateTime get lastModified => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<ProductModel> get products => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  bool get removed => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  @JsonKey(ignore: true)
  bool get needsSync => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
