import 'package:flutter_riverpod/flutter_riverpod.dart';

class SyncStateRepository extends StateNotifier<bool> {
  SyncStateRepository() : super(false);

  void setSyncing(bool isSyncing) {
    print('Syncing: $isSyncing');
    state = isSyncing;
  }

  bool get isSyncing => state;
}