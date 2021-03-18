import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_lists_app/data/hive.dart';
import 'package:shopping_lists_app/data/models/base_model_interface.dart';

abstract class BoxRepository<T extends BaseModelInterface>
    extends StateNotifier<Map<String, T>> {
  Box<T> box = Hive.box<T>(modelBoxMapping[T]!);

  BoxRepository() : super({}) {
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
    print('BoxRepository RUN');
    List<T> newItems = box.values.toList();
    state = Map.fromIterable(
      newItems,
      key: (item) => item.id,
      value: (item) => item,
    );
  }

  void save(T entity) {
    box.put(entity.id, entity);
  }

  T? get(String key) {
    return state[key];
  }
}
