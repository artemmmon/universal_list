import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source.dart';
import '../../data/item_model.dart';
import '../../data/services/like_service.dart';
import 'list_view_state.dart';

class ListCubit extends Cubit<ListViewState> {
  ListCubit({required DataSource dataSource})
      : _dataSource = dataSource,
        super(ListLoadingState()) {
    LikeService.instance().likedItems.addListener(_onLikedItemsChange);
  }

  final DataSource _dataSource;

  @override
  Future<void> close() {
    LikeService.instance().likedItems.removeListener(_onLikedItemsChange);
    return super.close();
  }

  void fetch() async {
    try {
      emit(ListLoadingState());

      final name = _dataSource.getName();
      final data = await _dataSource.getItemsModel();

      emit(
        ListLoadedState(
          listData: data,
          listViewMode: true,
          name: name,
          likedData: LikeService.instance().likedItems.value,
        ),
      );
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      emit(ListErrorState(massage: 'Error'));
    }
  }

  void changeViewMode(bool listViewMode) {
    final state = this.state;

    if (state is ListLoadedState) {
      emit(
        state.copyWith(listViewMode: listViewMode),
      );
    }
  }

  void like(ItemModel model) {
    LikeService.instance().like(model);
  }

  void unLike(ItemModel model) {
    LikeService.instance().unLike(model);
  }

  bool getIsLiked(ItemModel model) {
    final state = this.state;
    if (state is ListLoadedState) {
      return state.likedData.contains(model);
    }
    return false;
  }

  void _onLikedItemsChange() {
    final state = this.state;
    if (state is ListLoadedState) {
      final likedData = LikeService.instance().likedItems.value;
      emit(state.copyWith(likedData: likedData));
      emit(ListLoadedState(
          listData: state.listData,
          name: state.name,
          listViewMode: state.listViewMode,
          likedData: likedData));
    }
  }
}
