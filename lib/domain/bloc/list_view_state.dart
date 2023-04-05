import 'package:equatable/equatable.dart';

import '../../data/item_model.dart';

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
    required this.likedData,
  });

  ListLoadedState copyWith({
    List<ItemModel>? listData,
    String? name,
    bool? listViewMode,
    List<ItemModel>? likedData,
  }) {
    return ListLoadedState(
      listData: listData ?? this.listData,
      name: name ?? this.name,
      listViewMode: listViewMode ?? this.listViewMode,
      likedData: likedData ?? this.likedData,
    );
  }

  final List<ItemModel> listData;
  final String name;
  final bool listViewMode;
  final List<ItemModel> likedData;

  @override
  List<Object?> get props => [
        listData,
        name,
        listViewMode,
        likedData,
      ];
}
