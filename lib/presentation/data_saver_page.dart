import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_list/data/data_saver.dart';
import 'package:universal_list/domain/bloc/data_saver_cubit.dart';
import 'package:universal_list/presentation/data_saver_widget.dart';


class DataSaverPage extends StatelessWidget{
  const DataSaverPage({super.key, required this.dataSaver});

  final DataSaver dataSaver;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataSaverCubit>(
            create: (_) => DataSaverCubit(dataSaver),
            child:  DataSaverWidget(),
          );
  }


}