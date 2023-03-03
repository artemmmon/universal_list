import '../data/item_model.dart';

abstract class ListViewState {}

class ListLoadingState extends ListViewState {}

class ListErrorState extends ListViewState {
  ListErrorState({required this.massage});

  final String massage;

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
}
