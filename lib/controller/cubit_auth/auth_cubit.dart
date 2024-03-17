import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/auth/login.dart';
import 'package:untitled/data/datasourse/remote/auth/sign_up.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
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

  ClassName className = ClassName(
      networkInfo: getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());

  SSSS() async {
    try {
      if (formstateSign_up.currentState!.validate()) {
        statusReqest = StatusReqest.laoding;
        var response = await className.signUp1(
          username.text,
          emailSignUp.text,
          phone.text,
          passwordSign_up.text,
        );
        statusReqest = handingdata(response);
        if (StatusReqest.success == statusReqest) {
          emit(SuccessSignup());
        } else {
          statusReqest = StatusReqest.failure;
        }
      } else {
        autovalidateMode = AutovalidateMode.always;
      }
    } on ServerException catch (e) {
      statusReqest = StatusReqest.failure;

      emit(failer(ss: e.errorModel.errorMessage));
    }
  }

//////////////////////////////////////////////
  LoginData loginData =
      LoginData(getIt<NetworkInfoImpl>(), Api: getIt<DioConsumer>());
  gggg() async {
    try {
      if (formstate.currentState!.validate()) {
        emit(Loginloading());
        statusReqest = StatusReqest.laoding;
        var response = await loginData.Login_logic1(email.text, Password.text);
        statusReqest = handingdata(response);
        if (response['status'] == "success") {
          emit(LoginSuccess());
        } else {
          emit(LoginFailernodata());
        }
      } else {
        autovalidateMode = AutovalidateMode.always;
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit(LoginFailer());
    }
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
