// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_sibling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Siblingmodel _$SiblingmodelFromJson(Map<String, dynamic> json) => Siblingmodel(
      sibling_namedit: json['sibling_namedit'] as String? ?? '',
      sibling_relation: json['sibling_relation'] as String? ?? '',
      sibling_occupation: json['sibling_occupation'] as String? ?? '',
    );

Map<String, dynamic> _$SiblingmodelToJson(Siblingmodel instance) =>
    <String, dynamic>{
      'sibling_namedit': instance.sibling_namedit,
      'sibling_relation': instance.sibling_relation,
      'sibling_occupation': instance.sibling_occupation,
    };
