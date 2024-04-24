import '../../../../my core/databases/api/api_consumer.dart';
import '../../../../my core/databases/api/end_ponits.dart';

class Orderdata {
  final ApiConsumer Api;
  // StatusReqest? statusReqest;
  // final NetworkInfo networkInfo;

  Orderdata({required this.Api});

  checkout(Map data) async {
    var response =
        await Api.post(EndPoint.checkout, data: data, isFromData: true);
    return response;
  }
}
