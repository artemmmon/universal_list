import 'package:universal_list/data/item_model.dart';

abstract class DataSource {
  Future<List<ItemModel>> getItems();
}

/* =-=-=-=-=-= [Mock] =-=-=-=-=-= */

class DataSourceMock implements DataSource {
  @override
  Future<List<ItemModel>> getItems() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        ItemModel('', 'Title 1', 'Description 1'),
        ItemModel('', 'Title 2', 'Description 2'),
      ],
    );
  }
}

/* =-=-=-=-=-= [Rick & Morty] =-=-=-=-=-= */
