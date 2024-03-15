import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my core/connection/network_info.dart';
import 'package:untitled/my core/databases/api/dio_consumer.dart';
import 'package:untitled/my core/databases/cache/cache_helper.dart';

final getIt = GetIt.instance;
void setupServise() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  getIt.registerSingleton<NetworkInfoImpl>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));
  // getIt.registerSingleton<Crud>(
  //     Crud(api: getIt<DioConsumer>(), networkInfo: getIt<NetworkInfoImpl>()));
  // getIt.registerSingleton<StatusReqest>( StatusReqest());
}
