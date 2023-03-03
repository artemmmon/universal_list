import 'package:flutter/material.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:universal_list/presentation/element_list_widget.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.model});

  final ItemModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ElementListWidget(
              dataModel: model,
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
