import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data_source.dart';
import '../domain/list_controller.dart';
import 'list_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key,required this.dataSource}) : super(key: key);

  final DataSource dataSource;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
            create: (_) => ListController(dataSource: dataSource)..fetch(),
            child: const ListWidget(),
          );
  }
}
