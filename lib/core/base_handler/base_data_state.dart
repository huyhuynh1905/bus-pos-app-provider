import 'package:bus_pos_app/core/base_handler/base_error.dart';

abstract class DataState<T> {
  final T? dataState;
  final BaseError? error;
  const DataState({this.dataState, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T dataState) : super(dataState: dataState);
}

class DataError<T> extends DataState<T> {
  const DataError(BaseError error) : super(error: error);
}
