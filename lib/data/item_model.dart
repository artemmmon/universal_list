import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends Equatable {
  ItemModel(
    this.pictureUrl,
    this.title,
    this.description,
  );

  final String? pictureUrl;
  final String? title;
  final String? description;

  @override
  List<Object?> get props => [
        pictureUrl,
        title,
        description,
      ];

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
