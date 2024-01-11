// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model_sibling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModelSibling _$ListModelSiblingFromJson(Map<String, dynamic> json) =>
    ListModelSibling(
      (json['data'] as List<dynamic>)
          .map((e) => Siblingmodel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListModelSiblingToJson(ListModelSibling instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
