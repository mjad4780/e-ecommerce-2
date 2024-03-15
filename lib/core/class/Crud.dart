import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:http/http.dart' as https;

class Crud {
  final NetworkInfo networkInfo;
  final ApiConsumer api;

  Crud({required this.api, required this.networkInfo});

  Future<Either<StatusReqest, dynamic>> postData(
      String linkurl, Map data) async {
    final Dio dio = Dio();
    try {
      // if (await networkInfo.isConnected!) {
      var response = await dio.post(
        linkurl,
        data: data,
      );

      // var fff = response.data;
      // var responsebody = jsonDecode(response);
      // // Map fff = response['data'];
      // Map ff = responsebody;
      // print('#######################$responsebody');
      // dynamic responsebody = jsonEncode(response);
      dynamic responsebody = jsonEncode(response.data);

      return Right(responsebody);
      // } else {
      //   return const Left(StatusReqest.offlinefailure);
      // }
    } catch (_) {
      return const Left(StatusReqest.serverExpition);
    }
  }
}

// class Crud {
//   final NetworkInfo networkInfo;
//   final ApiConsumer api;

//   Crud({required this.networkInfo, required this.api});

//   Future<Either<StatusReqest, dynamic>> postData(
//       String linkurl, Map data) async {
//     // try {
//     // if (await checkInternet()) {
//     var response = await https.post(Uri.parse(linkurl), body: data);
//     print(response.statusCode);

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var responsebody = jsonDecode(jsonEncode(response.body));
//       print('##################################$responsebody');
//       return Right(responsebody);
//     } else {
//       return const Left(StatusReqest.serverfailure);
//     }
//     // } else {
//     //   return const Left(StatusReqest.offlinefailure);
//     // }
//     // } catch (_) {
//     //  return const Left(StatusReqest.serverfailure);
//     //   }
//     // }
//   }
// }


















































// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:untitled/core/class/StatusReqest.dart';
// import 'package:untitled/my%20core/connection/network_info.dart';
// import 'package:untitled/my%20core/databases/api/api_consumer.dart';

// class Crud {
//   final NetworkInfo networkInfo;
//   final ApiConsumer api;

//   Crud({required this.api, required this.networkInfo});

//   Future<Either<StatusReqest, Map>> postData(String link, Map data) async {
//     // try {
//     if (await networkInfo.isConnected!) {
//       final response = await api.post(
//         link,
//         data: data,
//       );
//       // if (response["status"].toString() == "success") {
//       // Map hh = jsonDecode(response.);
//       print('######################################$response');

//       Map hh = {};

//       hh.addAll(response.data);

//       print('###########################################$hh');
//       return Right(hh);
//       // } else {
//       //   return const Left(StatusReqest.serverfailure);
//       // }
//     } else {
//       return const Left(StatusReqest.offlinefailure);
//     }
//     // } catch (e) {
//     //   return const Left(StatusReqest.serverfailure);
//     // }
//   }
// }
