import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.Api, required this.networkInfo})
      : super(ForgetPasswordInitial());
  final ApiConsumer Api;
  StatusReqest? statusReqest = StatusReqest.none;
  final NetworkInfo networkInfo;

  TextEditingController emailForGet_Password = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController repassword = TextEditingController();
  GlobalKey<FormState> formstateforgetpasword = GlobalKey<FormState>();
  GlobalKey<FormState> formstatenewpassword = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  dispose() {
    emailForGet_Password.clear();
    repassword.clear();
    newpassword.clear();
  }
}
