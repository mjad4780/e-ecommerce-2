import '../../../../my core/databases/api/api_consumer.dart';
import '../../../../my core/databases/api/end_ponits.dart';
import '../../../../my core/databases/cache/cache_helper.dart';
import '../../../../my core/get_it/get_it.dart';

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

  Getorder() async {
    var response = await Api.post(EndPoint.getorder,
        data: {"id": getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);
    return response;
  }
}
