import 'package:flutter/material.dart';
import 'package:universal_list/domain/list_view_state.dart';

class ListController extends ValueNotifier<ListViewState> {
  ListController() : super(ListViewState());

  init() {
    value = ListViewState();
  }
}
