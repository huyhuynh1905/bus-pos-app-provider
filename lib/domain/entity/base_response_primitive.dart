class BaseResponsePrimitive<T> {
  bool? success;

  T? data;

  List<String>? errors;

  String? typeCard;

  BaseResponsePrimitive._();

  BaseResponsePrimitive(this.success, this.data, this.errors, this.typeCard);

  factory BaseResponsePrimitive.fromJson(Map<String, dynamic> json) {
    return BaseResponsePrimitive(
      json['success'] as bool?,
      json['data'] as T?,
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['typeCard'] as String?,
    );
  }
}
