import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_list/data/data_source.dart';
import 'package:universal_list/data/item_model.dart';

import '../../data_handler.dart';

class CustomDataSource implements DataSource, DataHandler {
  static const String _key = 'CustomDataSource';

  @override
  Future<List<ItemModel>> getItemsModel() async {
    final prefs = await SharedPreferences.getInstance();
    final source = prefs.getStringList(_key) ?? [];
    final result =
        source.map((e) => ItemModel.fromJson(jsonDecode(e))).toList();
    return result;
  }

  @override
  FutureOr saveData(ItemModel data) async {
    //витягаю повний список додаю до нього дату і зберігаю повний список
    final prefs = await SharedPreferences.getInstance();
    final source = prefs.getStringList(_key) ?? [];
    final result =
        source.map((e) => ItemModel.fromJson(jsonDecode(e))).toList();
    result.add(data);
    final dataSave = result.map((e) => jsonEncode(e.toJson()));
    prefs.setStringList(_key, dataSave.toList());
  }

  @override
  FutureOr removeData(ItemModel data) {
    // TODO: implement removeData
    throw UnimplementedError();
  }

  @override
  String getName() {
    return 'My List';
  }
}
