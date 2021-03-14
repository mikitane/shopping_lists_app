import 'package:shopping_lists_app/data/models/shopping_list_model.dart';
import 'package:shopping_lists_app/repositories/model_repository.dart';

class ShoppingListRepository extends ModelRepository<ShoppingListModel> {
  // TODO: Use real stream from database
  // StreamController<List<ShoppingListModel>> shoppingListsStreamController =
  //     StreamController.broadcast();
  // List<ShoppingListModel> shoppingLists = [
  //   ShoppingListModel(
  //     id: '1',
  //     name: 'Kauppalista',
  //   ),
  //   ShoppingListModel(
  //     id: '2',
  //     name: 'Viikonlopun kamat',
  //   ),
  //   ShoppingListModel(
  //     id: '3',
  //     name: 'Rautakauppalista',
  //   ),
  // ];

  // Stream<List<ShoppingListModel>> getShoppingListStream() {
  //   return shoppingListsStreamController.stream;
  // }
}


