import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class SignUp {
  Crud crud;
  SignUp(this.crud);
  getData(
    String username,
    String email,
    String phone,
    String password,
  ) async {
    var response = await crud.postData(EndPoint.Sugin_up, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
