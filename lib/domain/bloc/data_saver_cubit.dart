import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:universal_list/domain/bloc/data_saver_view_state.dart';

import '../../data/data_handler.dart';

class DataSaverCubit extends Cubit<DataSaverViewState> {
  DataSaverCubit(this._dataHandler) : super(DataSaverViewState());

  final DataHandler _dataHandler;

  Future save({
    required String title,
    required String description,
    required String image,
  }) async {
    final itemModel = ItemModel(image, title, description);
    await _dataHandler.saveData(itemModel);
  }
}
