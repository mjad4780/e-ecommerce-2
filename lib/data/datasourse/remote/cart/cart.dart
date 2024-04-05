import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

class CartData {
  final ApiConsumer Api;
  // StatusReqest? statusReqest;
  // final NetworkInfo networkInfo;

  CartData({required this.Api});

  addcart(int id) async {
    var response = await Api.post(EndPoint.add_cart,
        data: {'itemid': id, 'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);
    return response;
  }

  deletecart(int id) async {
    var response = await Api.post(EndPoint.delete_cart,
        data: {'itemid': id, 'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);

    return response;
  }

  getcurrentcart(int id) async {
    var response = await Api.post(EndPoint.getcurrent_cart,
        data: {'itemid': id, 'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);

    return response;
  }

  getcart() async {
    var response = await Api.post(EndPoint.getcart,
        data: {'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);

    return response;
  }
}
