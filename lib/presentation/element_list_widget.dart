import 'package:flutter/material.dart';

import '../data/item_model.dart';

class ElementListWidget extends StatelessWidget {
  const ElementListWidget({Key? key, required this.dataModel})
      : super(key: key);

  final ItemModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        title: Text(
          dataModel.title ?? "",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: Hero(
        tag: '${dataModel.hashCode}',
        child: Material(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green.shade900.withOpacity(0.6),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  dataModel.pictureUrl ?? '',
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black87.withOpacity(0.6),
                  ),
                  child: Text(
                    dataModel.description ?? '',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Josef',
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
