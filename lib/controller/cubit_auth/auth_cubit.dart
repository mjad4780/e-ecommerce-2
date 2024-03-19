import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/auth/login.dart';
import 'package:untitled/data/datasourse/remote/auth/sign_up.dart';
import 'package:untitled/data/datasourse/remote/auth/verfycode.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/errors/expentions.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.Api, required this.networkInfo})
      : super(AuthInitial());
  final ApiConsumer Api;
  StatusReqest? statusReqest = StatusReqest.none;
  final NetworkInfo networkInfo;

  //Login
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

// Sign_up

  TextEditingController username = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController passwordSign_up = TextEditingController();
  GlobalKey<FormState> formstateSign_up = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  very({
    required String val,
    required int max,
    required int min,
    required String text,
  }) {
    if (val.isEmpty) {
      return ' he isEmpty';
    }
    if (val.length > max) {
      return "can't be larger than $max";
    }
    if (val.length < min) {
      return "can't be less than $min";
    }
  }

  bool obscureText = true;

  hello() {
    obscureText = !obscureText;
    emit(AuthInitiagkl());
  }

  SignUp className =
      SignUp(networkInfo: getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());

  sign_up() async {
    try {
      if (formstateSign_up.currentState!.validate()) {
        emit(Signuploading());
        statusReqest = StatusReqest.laoding;
        var response = await className.signUp1(
          username.text,
          emailSignUp.text,
          phone.text,
          passwordSign_up.text,
        );
        statusReqest = handingdata(response);
        if (response['status'] == "success") {
          emit(SignupSuccess());
        } else {
          statusReqest = StatusReqest.failure;
          emit(SignUpFailernodata());
        }
      } else {
        autovalidateMode = AutovalidateMode.always;
      }
    } on ServerException catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit(SignUpfailer());
    }
  }

//////////////////////////////////////////////
  LoginData loginData =
      LoginData(getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());
  Login_Data() async {
    try {
      if (formstate.currentState!.validate()) {
        emit(Loginloading());
        statusReqest = StatusReqest.laoding;
        //  if (await networkInfo.isConnected!) {
        var response = await loginData.Login_logic1(email.text, Password.text);
        statusReqest = handingdata(response);

        if (response['status'] == "success") {
          print(response['data']['user_improve']);
          if (response['data']['user_improve'] != 1) {
            emit(Loginerrorverfy());
          } else {
            emit(LoginSuccess());
            getIt<CacheHelper>()
                .saveData(key: 'email', value: response['data']['user_email']);
            getIt<CacheHelper>().saveData(
                key: 'username', value: response['data']['user_name']);
            getIt<CacheHelper>()
                .saveData(key: 'password', value: response['data']['password']);
          }
        } else {
          emit(LoginFailernodata());
        }
        // } else {
        //   emit(LoginFailernodata());

        //   statusReqest = StatusReqest.offlinefailure;
        // }
      } else {
        autovalidateMode = AutovalidateMode.always;
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit(LoginFailer());
    }
  }

  VerfyCode verfyCode =
      VerfyCode(getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());

  VerfiCode(
    String verfycode,
  ) async {
    try {
      emit(LoadingVerfycode());
      statusReqest = StatusReqest.laoding;
      var response = await verfyCode.verfyCode(
          verfycode, email.text.isEmpty ? emailSignUp.text : email.text);
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        emit(SuccessVerfycode());
        dispose3();
      } else {
        emit(verfycodeFailernodata());
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit((failerverfycode()));
    }
  }

  SendVerfiCode() async {
    var response = await verfyCode
        .sendverfyCode(email.text.isEmpty ? emailSignUp.text : email.text);
  }

  dispose3() {
    email.clear();
    Password.clear();

    username.clear();
    phone.clear();
    passwordSign_up.clear();
    emailSignUp.clear();
  }
}
