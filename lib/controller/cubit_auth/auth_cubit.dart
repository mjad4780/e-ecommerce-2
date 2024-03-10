import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/screen/auth/Signup.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  //Login
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

// Sign_up

  TextEditingController username = TextEditingController();
  TextEditingController emailSignUp = TextEditingController();
  TextEditingController phome = TextEditingController();
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

  dispose3() {
    email.clear();
    Password.clear();
  }
}
