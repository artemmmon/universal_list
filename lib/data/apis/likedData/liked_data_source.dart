import 'package:universal_list/data/data_source.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:universal_list/data/services/like_service.dart';

class LikeDataSource implements DataSource {
  @override
  Future<List<ItemModel>> getItemsModel() async {
    final data = LikeService.instance().likedItems.value;

    if (data.isEmpty) throw Exception('List of empty');

    return data;
  }

  @override
  String getName() {
    return 'List Liked';
  }
}
