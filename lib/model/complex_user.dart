

import 'package:json_annotation/json_annotation.dart';
import 'package:profile_finder/model/address.dart';


part 'complex_user.g.dart';

@JsonSerializable(explicitToJson: true)
class ComplexUser {
  final int id;
  final String name;
  final String username;
  final String email;
  // final bool isActive;
  final Address address;

  ComplexUser(this.id, this.name, this.username, this.email, this.address);


    factory ComplexUser.fromJson(Map<String, dynamic> json) =>
     _$ComplexUserFromJson(json);

  

  Map<String ,dynamic> toJson() => _$ComplexUserToJson(this);

}