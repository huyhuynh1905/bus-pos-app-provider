import 'package:json_annotation/json_annotation.dart';

part 'base_response_list.g.dart';

@JsonSerializable()
class BaseResponseList {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  List<Map<String, dynamic>>? data;

  @JsonKey(name: 'messages')
  List<String>? errors;

  @JsonKey(name: 'typeCard')
  String? typeCard;

  BaseResponseList._();

  BaseResponseList(this.success, this.data, this.errors, this.typeCard);

  factory BaseResponseList.fromJson(Map<String, dynamic> json) => _$BaseResponseListFromJson(json);
}
