import 'dart:convert';

import 'cartoons_dto.dart';
import 'package:universal_list/data/data_source.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:http/http.dart' as http;

class CartoonsDataSource implements DataSource {
  @override
  Future<List<ItemModel>> getItemsModel() async {
    const url = 'https://api.sampleapis.com/cartoons/cartoons2D';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final dtos = List<CartoonsDTO>.from(
        data.map(
          (model) => CartoonsDTO.fromJson(model),
        ),
      );
      final result = dtos
          .map(
            (e) => ItemModel(e.image, e.title, e.year.toString()),
          )
          .toList();
      return result;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  @override
  String getName() {
    return 'Cartoons';
  }
}
