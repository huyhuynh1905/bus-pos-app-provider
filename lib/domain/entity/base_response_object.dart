import 'package:json_annotation/json_annotation.dart';

part 'base_response_object.g.dart';

@JsonSerializable()
class BaseResponseObj {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  Map<String, dynamic>? data;

  @JsonKey(name: 'messages')
  List<String>? errors;

  @JsonKey(name: 'typeCard')
  String? typeCard;

  BaseResponseObj._();

  BaseResponseObj(this.success, this.data, this.errors, this.typeCard);

  factory BaseResponseObj.fromJson(Map<String, dynamic> json) => _$BaseResponseObjFromJson(json);
}
