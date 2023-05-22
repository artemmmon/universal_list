import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/domain/bloc/data_saver_cubit.dart';
import 'package:universal_list/presentation/data_saver_widget.dart';

import '../data/data_handler.dart';


class DataSaverPage extends StatelessWidget{
  const DataSaverPage({super.key, required this.dataHandler});

  final DataHandler dataHandler;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataSaverCubit>(
            create: (_) => DataSaverCubit(dataHandler),
            child:  const DataSaverWidget(),
          );
  }


}