import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:universal_list/domain/list_view_state.dart';
import '../data/data_source.dart';

class ListController extends ValueNotifier<ListViewState> {
  ListController({required DataSource dataSource})
      : _dataSource = dataSource,
        super(ListLoadingState());

  final DataSource _dataSource;

  void fetch() async {
    try {
      value = ListLoadingState();

      final name = _dataSource.getName();
      final data = await _dataSource.getItemsModel();

      value = ListLoadedState(listData: data, listViewMode: true, name: name);
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      value = ListErrorState(massage: 'Error');
    }
  }

  void changeViewMode(bool listViewMode) {
    final value = this.value;
    if (value is! ListLoadedState) return;

    this.value = ListLoadedState(
      listData: value.listData,
      listViewMode: listViewMode,
      name: value.name,
    );
  }
}
