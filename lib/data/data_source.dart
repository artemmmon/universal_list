import 'package:universal_list/data/item_model.dart';

abstract class DataSource {
  Future<List<ItemModel>> getItems();
}

