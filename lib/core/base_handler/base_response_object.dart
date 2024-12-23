
class BaseResponseObject {
  int resultCode;
  String resultDescription;
  dynamic data;
  String time;
  int codeStatus;
  String messageStatus;
  String message;
  String description;
  int took;

  BaseResponseObject({
    required this.resultCode,
    required this.data,
    required this.resultDescription,
    required this.time,
    required this.codeStatus,
    required this.messageStatus,
    required this.message,
    required this.description,
    required this.took,
  });

  factory BaseResponseObject.fromJson(Map<String, dynamic> json) {
    return BaseResponseObject(
      resultCode: json['result_code'],
      data: json['data'],
      resultDescription: json['result_description'],
      time: json['time'],
      codeStatus: json['codeStatus'],
      messageStatus: json['messageStatus'],
      message: json['message'],
      description: json['description'],
      took: json['took'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result_code': resultCode,
      'data': data,
      'result_description': resultDescription,
      'time': time,
      'codeStatus': codeStatus,
      'messageStatus': messageStatus,
      'message': message,
      'description': description,
      'took': took,
    };
  }
}
