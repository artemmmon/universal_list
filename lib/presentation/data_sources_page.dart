import 'package:flutter/material.dart';
import 'package:universal_list/data/data_source.dart';
import 'package:universal_list/presentation/list_page.dart';

import '../data/apis/custom/custom_data_source.dart';
import 'data_saver_page.dart';
import 'decoration_widget.dart';

class DataSourcesPage extends StatelessWidget {
  const DataSourcesPage({Key? key, required this.dataSources})
      : super(key: key);

  final List<DataSource> dataSources;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DataSaverPage(dataHandler: CustomDataSource(),),
                ),
              );
            },
            icon: const Icon(Icons.add),
            color: Colors.amber,
          ),
        ],
        title: const Text(
          'Home page',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontFamily: 'Lobster',
          ),
        ),
        centerTitle: true,
      ),
      body: DecorationWidget(
        child: ListView.builder(
            itemCount: dataSources.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            ListPage(dataSource: dataSources[index])),
                  );
                },
                title: Text(dataSources[index].getName()),
              );
            }),
      ),
    );
  }
}
