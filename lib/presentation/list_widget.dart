import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/bloc/list_cubit.dart';
import '../domain/bloc/list_view_state.dart';
import 'decoration_widget.dart';
import 'grid_view_item.dart';
import 'item_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListViewState>(builder: (context, state) {
      final Widget content;

      if (state is ListLoadedState) {
        if (state.listViewMode) {
          content = ListView.builder(
              itemCount: state.listData.length,
              itemBuilder: (context, index) {
                final cubit = context.read<ListCubit>();
                final isLiked = cubit.getIsLiked(state.listData[index]);
                final model = state.listData[index];
                return ItemWidget(
                  model: model,
                  isLiked: isLiked,
                  canRemove: cubit.canHandleData,
                  onRemovePressed: () => cubit.removeItem(model),
                  onLongPress: () {
                    if (isLiked) {
                      cubit.unLike(model);
                    } else {
                      cubit.like(model);
                    }
                  },
                );
              });
        } else {
          content = GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: state.listData.length,
              itemBuilder: (context, index) {
                final cubit = context.read<ListCubit>();
                final isLiked = cubit.getIsLiked(state.listData[index]);
                final model = state.listData[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
                  child: GridViewItem(
                    model: model,
                    isLiked: isLiked,
                    onDoubleTab: () {
                      if (isLiked) {
                        cubit.unLike(model);
                      } else {
                        cubit.like(model);
                      }
                    },
                  ),
                );
              });
        }
      } else if (state is ListLoadingState) {
        content = const Center(child: CircularProgressIndicator());
      } else {
        content = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Error',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              IconButton(
                onPressed:
                    BlocProvider.of<ListCubit>(context, listen: false).fetch,
                icon: const Icon(
                  Icons.file_download,
                ),
              ),
            ],
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            if (state is ListLoadedState)
              Switch(
                value: state.listViewMode,
                onChanged: BlocProvider.of<ListCubit>(context, listen: false)
                    .changeViewMode,
              ),
          ],
          backgroundColor: Colors.green.shade900,
          title: Text(
            (state is ListLoadedState) ? state.name : '',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              fontFamily: 'Lobster',
            ),
          ),
          centerTitle: true,
        ),
        body: DecorationWidget(
          child: content,
        ),
      );
    });
  }
}
