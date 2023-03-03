import 'package:json_annotation/json_annotation.dart';

part 'simpsons_dto.g.dart';

@JsonSerializable()
class SimpsonsDTO {
  SimpsonsDTO({
    required this.character,
    required this.image,
    required this.quote,
  });

  final String character;
  final String image;
  final String quote;

  factory SimpsonsDTO.fromJson(Map<String, dynamic> json) =>
      _$SimpsonsDTOFromJson(json);
}
