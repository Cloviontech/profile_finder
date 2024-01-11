
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';


@JsonSerializable()


class Address {
  final String street;
  final String suite;
  // @JsonKey(name: 'postal_code')
  @JsonKey(name: 'city')
  
  final String city;

  // Address(this.street, this.area,  this.postalCode);
  

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Address(this.street, this.suite, this.city);

 

  Map<String ,dynamic> toJson() => _$AddressToJson(this);
}