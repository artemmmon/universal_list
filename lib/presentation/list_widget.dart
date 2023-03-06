import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_list/domain/list_controller.dart';
import 'package:universal_list/bloc/list_view_state.dart';
import 'decoration_widget.dart';
import 'grid_view_item.dart';
import 'item_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ListController>(builder: (context, controller, _) {
      final state = controller.value;

      final Widget content;

      if (state is ListLoadedState) {
        if (state.listViewMode) {
          content = ListView.builder(
              itemCount: state.listData.length,
              itemBuilder: (context, index) {
                return ItemWidget(model: state.listData[index]);
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
                return Padding(
                  padding: const EdgeInsets.only(top: 10, left: 7, right: 7),
                  child: GridViewItem(model: state.listData[index]),
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
                onPressed: controller.fetch,
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
                onChanged: controller.changeViewMode,
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
