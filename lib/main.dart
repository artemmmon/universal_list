import 'package:flutter/material.dart';
import 'package:universal_list/data/apis/cartoons/cartoons_data_source.dart';
import 'package:universal_list/data/apis/rickMorty/rick_morty_data_source.dart';
import 'package:universal_list/presentation/data_sources_page.dart';

import 'data/apis/simpsons/simpsons_data_source.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DataSources',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DataSourcesPage(
        dataSources: [
          SimpsonsDataSource(),
          RickMortyDataSource(),
          CartoonsDataSource(),
        ],
      ),
    );
  }
}