import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/errors/expentions.dart';

class ClassName {
  final NetworkInfo networkInfo;
  final ApiConsumer Api;

  ClassName({required this.networkInfo, required this.Api});

  signUp1(
    String username,
    String email,
    String phone,
    String password,
  ) async {
    if (await networkInfo.isConnected!) {
      var response = await Api.post(
        EndPoint.Sugin_up,
        isFromData: true,
        data: {
          'username': username,
          'email': email,
          'phone': phone,
          'password': password
        },
      );
    } else {
      return StatusReqest.offlinefailure;
    }
  }
}
