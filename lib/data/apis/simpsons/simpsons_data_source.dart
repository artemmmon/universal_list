import 'dart:convert';

import 'package:universal_list/data/apis/simpsons/simpsons_dto.dart';
import 'package:universal_list/data/data_source.dart';
import 'package:universal_list/data/item_model.dart';
import 'package:http/http.dart' as http;

class SimpsonsDataSource implements DataSource {
  @override
  Future<List<ItemModel>> getItemsModel() async {
    const url = 'https://thesimpsonsquoteapi.glitch.me/quotes?count=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final dtos = List<SimpsonsDTO>.from(
        data.map(
          (model) => SimpsonsDTO.fromJson(model),
        ),
      );
      final result = dtos
          .map(
            (e) => ItemModel(e.image, e.character, e.quote),
          )
          .toList();
      return result;
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  }

  @override
  String getName() {
    return 'Simpsons';
  }
}
