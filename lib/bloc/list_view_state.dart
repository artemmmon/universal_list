import 'package:equatable/equatable.dart';

import '../data/item_model.dart';

abstract class ListViewState extends Equatable {}

class ListLoadingState extends ListViewState {
  @override
  List<Object?> get props => [];
}

class ListErrorState extends ListViewState {
  ListErrorState({required this.massage});

  final String massage;

  @override
  List<Object?> get props => [massage];
}

class ListLoadedState extends ListViewState {
  ListLoadedState({
    required this.listData,
    required this.name,
    required this.listViewMode,
  });

  final List<ItemModel> listData;
  final String name;
  final bool listViewMode;

  @override
  List<Object?> get props => [
        listData,
        name,
        listViewMode,
      ];
}
