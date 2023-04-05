import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_list/data/item_model.dart';

class LikeService {
  LikeService._();

   static const String _key = 'likeData';

  factory LikeService.instance() => _instance ??= LikeService._();

  static LikeService? _instance;

  final ValueNotifier<List<ItemModel>> _controller = ValueNotifier([]);

  late final ValueListenable<List<ItemModel>> likedItems = _controller;

  Future initialize() async{
    final prefs = await SharedPreferences.getInstance();
    final source = prefs.getStringList(_key) ?? [];
    final result = source.map((e) => ItemModel.fromJson(jsonDecode(e)));
    _controller.value = result.toList();
  }

  Future like(ItemModel model) async {
    final list = [..._controller.value];
    list.add(model);
    _controller.value = list;
    _onChange();
  }

  void unLike(ItemModel model) {
    final list = [..._controller.value];
    list.remove(model);
    _controller.value = list;
    _onChange();
  }

  bool getIsLiked(ItemModel model) {
    return _controller.value.contains(model);
  }

  Future _onChange() async {
    final prefs = await SharedPreferences.getInstance();
    final list = _controller.value;
    final source = list.map((e) => jsonEncode(e.toJson()));
    prefs.setStringList(_key, source.toList());
  }
}
