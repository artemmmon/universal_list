import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cartoons_dto.g.dart';

@JsonSerializable()
class CartoonsDTO {
  CartoonsDTO({
    required this.title,
    required this.image,
    required this.year,
  });

  final String title;
  final String image;
  final int year;

  factory CartoonsDTO.fromJson(Map<String, dynamic> json) =>
      _$CartoonsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CartoonsDTOToJson(this);

  void test() {
final json = jsonEncode(this.toJson());
  }
}