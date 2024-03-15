import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/auth/sign_up.dart';
import 'package:untitled/data/datasourse/remote/test_data.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/errors/expentions.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/screen/auth/Signup.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.Api}) : super(AuthInitial());
  final ApiConsumer Api;
  StatusReqest? statusReqest;

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
//forget_password
  TextEditingController emailForGet_Password = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController repassword = TextEditingController();
  GlobalKey<FormState> formstateforgetpasword = GlobalKey<FormState>();
  GlobalKey<FormState> formstatenewpassword = GlobalKey<FormState>();

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
      return 'no can input >$max';
    }
    if (val.length < min) {
      return 'no can input <$min';
    }
  }

  bool obscureText = true;

  hello() {
    obscureText = !obscureText;
    emit(AuthInitiagkl());
  }

  SignUp signUp = SignUp(getIt<Crud>());

  List deta = [];

  // Sign_Up() async {
  //   statusReqest = StatusReqest.laoding;
  //   var response = await signUp.getData(
  //     username.text,
  //     emailSignUp.text,
  //     phone.text,
  //     passwordSign_up.text,
  //   );
  //   statusReqest = handingdata(response);
  //   if (StatusReqest.success == statusReqest) {
  //     emit(SuccessSignup());

  //     if (response['status'] == "success") {
  //       // deta.addAll(response['data']);
  //       // print(deta);
  //       print(response);
  //     } else {
  //       statusReqest = StatusReqest.failure;
  //     }
  //     // test = Data.fromJson(response['data']);
  //     //print(test);
  //   }
  //   // emit(Testgetdate());
  // }

  signUp1() async {
    try {
      statusReqest = StatusReqest.laoding;
      var response = await signUp.getData(
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
    } on ServerException catch (e) {
      emit(failer(ss: e.errorModel.errorMessage));
    }
  }

  dispose3() {
    email.clear();
    Password.clear();

    username.clear();
    phone.clear();
    passwordSign_up.clear();
    emailSignUp.clear();

    emailForGet_Password.clear();
    repassword.clear();
    newpassword.clear();
  }
}

  // signUp1() async {
  //   try {
  //     statusReqest = StatusReqest.laoding;
  //     var response = await Api.post(
  //       EndPoint.Sugin_up,
  //       isFromData: true,
  //       data: {
  //         'username': username.text,
  //         'email': emailSignUp.text,
  //         'phone': phone.text,
  //         'password': passwordSign_up.text,
  //       },
  //     );
  //     statusReqest = handingdata(response);
  //     if (StatusReqest.success == statusReqest) {
  //     emit(SuccessSignup());


  //     }else{
  //     statusReqest = StatusReqest.failure;

  //     }
  //   } on ServerException catch (e) {
  //     emit(failer(ss: e.errorModel.errorMessage));
  //   }
  // }
