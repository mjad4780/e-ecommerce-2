import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class LoginData {
  final ApiConsumer Api;
  StatusReqest? statusReqest;
  final NetworkInfo networkInfo;

  LoginData(this.networkInfo, {required this.Api});

  Login_logic1(String email, String password) async {
    var response = await Api.post(EndPoint.linklogin,
        data: {
          'email': email,
          'password': password,
        },
        isFromData: true);
    return response;
  }
}
