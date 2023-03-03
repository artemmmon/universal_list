// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartoons_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartoonsDTO _$CartoonsDTOFromJson(Map<String, dynamic> json) => CartoonsDTO(
      title: json['title'] as String,
      image: json['image'] as String,
      year: json['year'] as int,
    );

Map<String, dynamic> _$CartoonsDTOToJson(CartoonsDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
      'year': instance.year,
    };
