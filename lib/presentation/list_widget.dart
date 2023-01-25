import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_list/domain/list_controller.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ListController>().value;

    // TODO: implement build
    throw UnimplementedError();
  }

}