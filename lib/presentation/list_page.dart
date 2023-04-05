import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_source.dart';
import '../domain/bloc/list_cubit.dart';
import 'list_widget.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key,required this.dataSource}) : super(key: key);

  final DataSource dataSource;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListCubit>(
            create: (_) => ListCubit(dataSource: dataSource)..fetch(),
            child: const ListWidget(),
          );
  }
}
