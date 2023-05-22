import 'dart:async';

import 'package:universal_list/data/item_model.dart';

abstract class DataHandler {
  FutureOr saveData(ItemModel data);

  FutureOr removeData(ItemModel data);

}