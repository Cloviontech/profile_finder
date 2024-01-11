import 'package:json_annotation/json_annotation.dart';
import 'package:profile_finder/model_final/model_sibling/model_sibling.dart';

part 'list_model_sibling.g.dart';

@JsonSerializable()
class ListModelSibling {
  List <Siblingmodel> data;
  ListModelSibling(this.data);
  factory ListModelSibling.fromJson(Map<String, dynamic> json) =>
      _$ListModelSiblingFromJson(json);
  Map<String, dynamic> toJson() => _$ListModelSiblingToJson(this);
}
