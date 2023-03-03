// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_morty_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RickMortyDTO _$RickMortyDTOFromJson(Map<String, dynamic> json) => RickMortyDTO(
      name: json['name'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$RickMortyDTOToJson(RickMortyDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'image': instance.image,
    };
