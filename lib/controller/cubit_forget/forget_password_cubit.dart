import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/forget_passsword/Repassword.dart';
import 'package:untitled/data/datasourse/remote/forget_passsword/ceck_email.dart';
import 'package:untitled/data/datasourse/remote/forget_passsword/verfycode_forget_password.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/errors/expentions.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.Api, required this.networkInfo})
      : super(ForgetPasswordInitial());
  final ApiConsumer Api;
  StatusReqest? statusReqest = StatusReqest.none;
  final NetworkInfo networkInfo;

  TextEditingController emailForGet_Password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  TextEditingController repassword2 = TextEditingController();

  GlobalKey<FormState> formstateforgetpasword = GlobalKey<FormState>();
  GlobalKey<FormState> formstatenewpassword = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  CheckEmail checkemail = CheckEmail(
      networkInfo: getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());

  checkEmail() async {
    try {
      if (formstateforgetpasword.currentState!.validate()) {
        emit(CheckEmailloading());
        statusReqest = StatusReqest.laoding;
        var response = await checkemail.check_email(emailForGet_Password.text);
        statusReqest = handingdata(response);
        if (response['status'] == "success") {
          emit(CheckEmailSuccess());
        } else {
          // statusReqest = StatusReqest.failure;
          emit(CheckEmailFailernodata());
        }
      } else {
        autovalidateMode = AutovalidateMode.always;
      }
    } on ServerException catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit(CheckEmailfailer());
    }
  }

// //////////////////////////////////////////////
  VerfyCode_forget verfyCode_forget =
      VerfyCode_forget(getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());
  verfyCode(String verfycode) async {
    try {
      emit(verfycodeforloading());
      statusReqest = StatusReqest.laoding;
      var response = await verfyCode_forget.verfycode_forget(
        verfycode,
        emailForGet_Password.text,
      );
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        emit(verfycodeforSuccess());
      } else {
        emit(verfycodeforFailernodata());
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit(verfycodeforfailer());
    }
  }

  Repassword repassworer =
      Repassword(getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());

  Repasswor() async {
    try {
      if (formstatenewpassword.currentState!.validate()) {
        if (repassword.text != repassword2.text) {
          emit(Repasswordloading());
          statusReqest = StatusReqest.laoding;
          var response = await repassworer.repassword(
              emailForGet_Password.text, repassword.text);
          statusReqest = handingdata(response);
          if (response['status'] == "success") {
            emit(RepasswordSuccess());
            dispose();
          } else {
            emit(RepasswordFailernodata());
          }
        } else {
          emit(RepasswordNull());
        }
      } else {
        autovalidateMode = AutovalidateMode.always;
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit((RepasswordFailer()));
    }
  }

  dispose() {
    emailForGet_Password.clear();
    repassword.clear();
  }
}
