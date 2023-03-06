import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/data_source.dart';
import 'list_view_state.dart';


class CubitListController extends Cubit<ListViewState> {
  CubitListController({required DataSource dataSource})
      : _dataSource = dataSource,
        super(ListLoadingState());

  final DataSource _dataSource;

  void fetch() async {
    try {
      emit(ListLoadingState());

      final name = _dataSource.getName();
      final data = await _dataSource.getItemsModel();

      emit(ListLoadedState(listData: data, listViewMode: true, name: name));
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      emit(ListErrorState(massage: 'Error'));
    }
  }

  void changeViewMode(bool listViewMode) async {
    final _name = _dataSource.getName();
    final _data = await _dataSource.getItemsModel();
    if (state is ListLoadedState) {
      emit(
        ListLoadedState(
          listData: _data,
          listViewMode: listViewMode,
          name: _name,
        ),
      );
    }

    // if (state is! ListLoadedState)
    //   return;
    // else
    //   emit(
    //     ListLoadedState(
    //       listData: _dataSource.getItemsModel().,
    //       listViewMode: listViewMode,
    //       name:,
    //     ),
    //   );
  }
}
