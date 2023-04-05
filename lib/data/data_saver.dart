import 'dart:async';

import 'package:universal_list/data/item_model.dart';

abstract class DataSaver {
  FutureOr saveData(ItemModel data);
}