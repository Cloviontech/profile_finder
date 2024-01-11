// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplexUser _$ComplexUserFromJson(Map<String, dynamic> json) => ComplexUser(
      json['id'] as int,
      json['name'] as String,
      json['username'] as String,
      json['email'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComplexUserToJson(ComplexUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address.toJson(),
    };
