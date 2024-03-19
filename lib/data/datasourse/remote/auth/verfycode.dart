import 'dart:convert';

import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class VerfyCode {
  final ApiConsumer Api;
  StatusReqest? statusReqest;
  final NetworkInfo networkInfo;

  VerfyCode(this.networkInfo, {required this.Api});

  verfyCode(
    String verfycode,
    String email,
  ) async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.post(EndPoint.verfycode,
        data: {
          'email': email,
          'verfycode': verfycode,
        },
        isFromData: true);
    return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }

  sendverfyCode(
    String email,
  ) async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.post(EndPoint.sendverfycode,
        data: {
          'email': email,
        },
        isFromData: true);
    return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }
}
