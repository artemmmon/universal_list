import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:universal_list/presentation/element_list_widget.dart';

import '../domain/bloc/like_cubit.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.model,
    required this.isLiked,
    required this.onLongPress,
    this.canRemove = false,
    this.onRemovePressed,
  });

  final ItemModel model;
  final bool isLiked;
  final bool canRemove;
  final VoidCallback? onRemovePressed;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLiked) const Text('❤️', style: TextStyle(fontSize: 32)),
          if (canRemove)
            IconButton(
              onPressed: () => onRemovePressed?.call(),
              icon: const Icon(Icons.close),
            ),
        ],
      ),
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
      title: Text(
        model.title ?? '',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.amber,
          fontFamily: 'Lobster',
        ),
      ),
      subtitle: Text(
        model.description ?? '',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Hero(
        tag: '${model.hashCode}',
        child: Container(
          height: 50,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(model.pictureUrl ?? ''),
            ),
          ),
        ),
      ),
    );
  }
}
