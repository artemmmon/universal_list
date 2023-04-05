import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/item_model.dart';
import '../domain/bloc/like_cubit.dart';
import 'element_list_widget.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.model,
    required this.isLiked,
    required this.onDoubleTab,
  });

  final ItemModel model;
  final bool isLiked;
  final VoidCallback onDoubleTab;

  @override
  Widget build(BuildContext context) {
    final Widget likeText = isLiked
        ? const Text(
            '❤️',
            style: TextStyle(fontSize: 20),
          )
        : const SizedBox();
    return GestureDetector(
      onDoubleTap: onDoubleTab,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider<LikeCubit>(
              create: (_) => LikeCubit(model),
              child: ElementListWidget(
                dataModel: model,
              ),
            ),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              model.pictureUrl ?? '',
            ),
          ),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
          // height: 50,
          width: 300,
          color: Colors.black.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: likeText,
                ),
                Text(
                  model.title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lobster',
                    color: Colors.amber,
                  ),
                ),
                Text(
                  model.description ?? '',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
