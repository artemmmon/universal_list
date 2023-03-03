// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simpsons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpsonsDTO _$SimpsonsDTOFromJson(Map<String, dynamic> json) => SimpsonsDTO(
      character: json['character'] as String,
      image: json['image'] as String,
      quote: json['quote'] as String,
    );

Map<String, dynamic> _$SimpsonsDTOToJson(SimpsonsDTO instance) =>
    <String, dynamic>{
      'character': instance.character,
      'image': instance.image,
      'quote': instance.quote,
    };
