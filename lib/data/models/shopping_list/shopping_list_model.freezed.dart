// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ShoppingListModelTearOff {
  const _$ShoppingListModelTearOff();

  _ShoppingListModel call(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required DateTime lastModified,
      @HiveField(3) List<ProductModel> products = const []}) {
    return _ShoppingListModel(
      id: id,
      name: name,
      lastModified: lastModified,
      products: products,
    );
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
      @HiveField(3) List<ProductModel> products});
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
      @HiveField(3) List<ProductModel> products});
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
    ));
  }
}

@HiveType(typeId: 0, adapterName: 'ShoppingListModelAdapter')

/// @nodoc
class _$_ShoppingListModel implements _ShoppingListModel {
  _$_ShoppingListModel(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.lastModified,
      @HiveField(3) this.products = const []});

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

  @override
  String toString() {
    return 'ShoppingListModel(id: $id, name: $name, lastModified: $lastModified, products: $products)';
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
                    .equals(other.products, products)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastModified) ^
      const DeepCollectionEquality().hash(products);

  @JsonKey(ignore: true)
  @override
  _$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith =>
      __$ShoppingListModelCopyWithImpl<_ShoppingListModel>(this, _$identity);
}

abstract class _ShoppingListModel implements ShoppingListModel {
  factory _ShoppingListModel(
      {@HiveField(0) required String id,
      @HiveField(1) required String name,
      @HiveField(2) required DateTime lastModified,
      @HiveField(3) List<ProductModel> products}) = _$_ShoppingListModel;

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
  @JsonKey(ignore: true)
  _$ShoppingListModelCopyWith<_ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
