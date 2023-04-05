import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/data/data_saver.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:universal_list/domain/bloc/data_saver_view_state.dart';

class DataSaverCubit extends Cubit<DataSaverViewState> {
  DataSaverCubit(this._dataSaver) : super(DataSaverViewState());

  final DataSaver _dataSaver;

  Future save({
    required String title,
    required String description,
    required String image,
  }) async {
    final itemModel = ItemModel(image, title, description);
    await _dataSaver.saveData(itemModel);
  }
}
