import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/domain/bloc/like_state.dart';
import '../../data/item_model.dart';
import '../../data/services/like_service.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit(this.model)
      : super(
          LikeState(
            isLiked: LikeService.instance().getIsLiked(model),
          ),
        ) {
    LikeService.instance().likedItems.addListener(_onLikedItemsChange);
  }

  final ItemModel model;

  @override
  Future<void> close() {
    LikeService.instance().likedItems.removeListener(_onLikedItemsChange);
    return super.close();
  }

  void like() {
    LikeService.instance().like(model);
  }

  void unLike() {
    LikeService.instance().unLike(model);
  }

  void _onLikedItemsChange() {
    final likeItem = LikeService.instance().getIsLiked(model);
    emit(state.copyWithLike(isLiked: likeItem));
  }
}
