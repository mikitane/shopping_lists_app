import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_lists_app/data/api/config.dart';
import 'package:shopping_lists_app/data/api/sync_services/shopping_list_sync_service.dart';
import 'package:shopping_lists_app/providers.dart';

class SyncController {
  SyncController({ required this.read });

  final Reader read;

  Future<void> syncData() async {
    final syncStateRepo = read(syncStateRepositoryProvider);

    if (syncStateRepo.isSyncing) {
      print('Already syncing -> return');
      return;
    }

    syncStateRepo.setSyncing(true);
    final defaultHeaders = {
      'Authorization': 'Bearer $ACCESS_TOKEN',
      'Content-Type': 'application/json',
    };

    await syncShoppingListsToServer(read, defaultHeaders);

    // final uri = Uri.parse(BASE_URL + '/shopping-list/aa00f3a5-e64f-4589-8f27-be119f31e001');
    // final res = await http.get(uri, headers: headers);
    // print(res.body);
    syncStateRepo.setSyncing(false);

  }


}