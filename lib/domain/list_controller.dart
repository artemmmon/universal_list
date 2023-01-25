import 'package:flutter/material.dart';
import 'package:universal_list/domain/list_view_state.dart';

import '../data/data_source.dart';

class ListController extends ValueNotifier<ListViewState> {
  ListController({required DataSource dataSource})
      : _dataSource = dataSource,
        super(ListViewState());

  final DataSource _dataSource;

  fetch() async {
    // TODO(Yacob): fetch data from _dataSource
  }
}
