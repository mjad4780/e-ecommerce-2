import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';

class Crud {
  final NetworkInfo networkInfo;
  final ApiConsumer api;

  Crud({required this.api, required this.networkInfo});

  Future<Either<StatusReqest, Map>> postData(String link, Map data) async {
    try {
      if (await networkInfo.isConnected!) {
        final response = await api.post(
          link,
          data: data,
        );
        // if (response["status"].toString() == "success") {
        Map hh = jsonDecode(response);
        print(response);
        print(hh);
        return Right(hh);
        // } else {
        //   return const Left(StatusReqest.serverfailure);
        // }
      } else {
        return const Left(StatusReqest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusReqest.serverfailure);
    }
  }
}
