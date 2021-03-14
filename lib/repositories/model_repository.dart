import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_lists_app/data/hive.dart';
import 'package:shopping_lists_app/data/models/base_model_interface.dart';

abstract class ModelRepository<T extends BaseModelInterface> extends StateNotifier<List<T>> {
  Box<T> box = Hive.box<T>(modelBoxMapping[T]!);

  ModelRepository() : super([]) {
    _initDb();
  }

  void _initDb() {
    // Initial Data
    _updateFromDb();

    // Watch for changes in the box
    box.listenable().addListener(() {
      _updateFromDb();
    });
  }

  void _updateFromDb() {
    state = box.values.toList();
  }

  void save(T entity) {
    box.put(entity.id, entity);
  }

  T? get(String key) {
    return box.get(key);
  }

}
