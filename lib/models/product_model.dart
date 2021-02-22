import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductModel {
  ProductModel({@required this.name, @required this.done});

  Uuid id;
  String name;
  bool done;
}