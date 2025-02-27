import 'package:bus_pos_app/data/remote/api_sub_link.dart';
import 'package:bus_pos_app/data/remote/payment_dio_api.dart';
import 'package:bus_pos_app/domain/entity/base_response_list.dart';
import 'package:bus_pos_app/shared/res/strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_payment_client.g.dart';

@RestApi()
abstract class APIPaymentClient {
  factory APIPaymentClient(PaymentDio dio) = _APIPaymentClient;

  @GET(ApiSubLink.pathGetPublicKey)
  Future<String?> requestPublicKey(@Header(
      Constants.fieldTOKEN) token,
      @Header(Constants.systemType) type
      );

  @GET(ApiSubLink.pathGetBankBinInfor)
  Future<BaseResponseList> requestBankInfo(
      @Header(Constants.fieldTOKEN) token,
      @Header(Constants.systemType) type
  );
}