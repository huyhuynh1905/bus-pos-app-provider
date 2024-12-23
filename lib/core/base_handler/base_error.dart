
class BaseError {
  int resultCode;
  dynamic data;
  String time;
  int codeStatus;
  String messageStatus;
  String message;
  int took;
  BaseError({
    this.data,
    this.resultCode = -1,
    this.time = "",
    this.codeStatus = 0,
    this.messageStatus = "",
    this.message = "",
    this.took = -1,
  });
}
