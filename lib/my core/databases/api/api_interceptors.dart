import 'package:dio/dio.dart';
import 'package:untitled/my core/databases/api/end_ponits.dart';
import 'package:untitled/my core/databases/cache/cache_helper.dart';
import 'package:untitled/my core/get_it/get_it.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//options.queryParameters[]
    options.headers['Accept-Language'] = "ar";

    // options.headers['Content-Type'] = "application/json";

    options.headers['Authorization'] =
        getIt<CacheHelper>().getDataString(key: ApiKey.token);

    super.onRequest(options, handler);
  }
}
