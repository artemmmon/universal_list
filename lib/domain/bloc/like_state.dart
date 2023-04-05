import 'package:equatable/equatable.dart';

class LikeState extends Equatable {
  const LikeState({required this.isLiked});

  LikeState copyWithLike({
    bool? isLiked,
  }) {
    return LikeState(
      isLiked: isLiked ?? this.isLiked,
    );
  }

  final bool isLiked;

  @override
  List<Object?> get props => [
        isLiked
      ];
}
