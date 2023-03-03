import 'package:json_annotation/json_annotation.dart';

part 'rick_morty_dto.g.dart';

@JsonSerializable()
class RickMortyDTO {
  RickMortyDTO({required this.name, required this.gender, required this.image});

  final String name;
  final String gender;
  final String image;

  factory RickMortyDTO.fromJson(Map<String, dynamic> json) =>
      _$RickMortyDTOFromJson(json);
}
