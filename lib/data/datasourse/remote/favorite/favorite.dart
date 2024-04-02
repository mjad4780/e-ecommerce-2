import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

class FavoriteData {
  final ApiConsumer Api;
  // StatusReqest? statusReqest;
  // final NetworkInfo networkInfo;

  FavoriteData({required this.Api});

  addfavorite(int id) async {
    var response = await Api.post(EndPoint.addfavorite,
        data: {'id': id, 'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);
    return response;
  }

  removefavorite(int id) async {
    var response = await Api.post(EndPoint.removefavorite,
        data: {'id': id, 'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);

    return response;
  }

  getfavorite() async {
    var response = await Api.post(EndPoint.getfavorite,
        data: {'userid': getIt<CacheHelper>().getData(key: 'id')},
        isFromData: true);

    return response;
  }
}
