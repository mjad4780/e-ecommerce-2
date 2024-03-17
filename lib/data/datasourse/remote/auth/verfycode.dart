import 'dart:convert';

import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class VerfyCode {
  final NetworkInfo networkInfo;
  final ApiConsumer Api;

  VerfyCode({required this.networkInfo, required this.Api});

  verfycode(
    String verfycode,
    String email,
  ) async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.post(
      EndPoint.verfycode,
      isFromData: true,
      data: {
        'email': email,
        'verfycode': verfycode,
      },
    );

    print('##########################$email');
    // } else {
    //   return StatusReqest.offlinefailure;
    // }
  }
}
