import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class Repassword {
  final ApiConsumer Api;
  StatusReqest? statusReqest;
  final NetworkInfo networkInfo;

  Repassword(this.networkInfo, {required this.Api});

  repassword(String email, String password) async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.post(EndPoint.Repassword,
        data: {'email': email, 'password': password}, isFromData: true);
    return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }
}
