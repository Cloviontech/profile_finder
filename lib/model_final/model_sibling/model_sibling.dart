


import 'package:json_annotation/json_annotation.dart';

part 'model_sibling.g.dart';

@JsonSerializable()
class Siblingmodel {
  String sibling_namedit;
  String sibling_relation;
  String sibling_occupation;
  
  // String xyz;
  Siblingmodel({this.sibling_namedit='', this.sibling_relation='', this.sibling_occupation=''});
  factory Siblingmodel.fromJson(Map<String, dynamic> json) => _$SiblingmodelFromJson(json);
  Map<String, dynamic> toJson() => _$SiblingmodelToJson(this);
}






// import 'package:json_annotation/json_annotation.dart';

// part 'model_sibling.g.dart';



// @JsonSerializable()
// class ModelSibling {
//   String sibName;
//   String sibRelation;
//   String sibJob;

//   ModelSibling(this.sibName, this.sibRelation, this.sibJob);
//   factory ModelSibling.fromJson(Map<String,dynamic> json) => _$ModelFromJson(json);
//   Map<String,dynamic> toJson() => _$ModelToJson(this);


// }