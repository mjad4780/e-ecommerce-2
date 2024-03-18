import 'dart:convert';

import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class VerfyCode_forget {
  final ApiConsumer Api;
  StatusReqest? statusReqest;
  final NetworkInfo networkInfo;

  VerfyCode_forget(this.networkInfo, {required this.Api});

  verfycode_forget(
    String verfycode,
    String email,
  ) async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.post(EndPoint.verfycode_forget,
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
}
