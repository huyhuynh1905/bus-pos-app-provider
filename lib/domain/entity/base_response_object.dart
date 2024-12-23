import 'package:json_annotation/json_annotation.dart';

part 'base_response_object.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  Map<String, dynamic>? data;

  @JsonKey(name: 'messages')
  List<String>? errors;

  @JsonKey(name: 'typeCard')
  String? typeCard;

  BaseResponse._();

  BaseResponse(this.success, this.data, this.errors, this.typeCard);

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);
}
