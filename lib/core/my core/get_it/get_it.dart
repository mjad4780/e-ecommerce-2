import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/core/my core/connection/network_info.dart';
import 'package:untitled/core/my core/databases/api/dio_consumer.dart';
import 'package:untitled/core/my core/databases/cache/cache_helper.dart';

final getIt = GetIt.instance;
void setupServise() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  getIt.registerSingleton<NetworkInfoImpl>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));
}
