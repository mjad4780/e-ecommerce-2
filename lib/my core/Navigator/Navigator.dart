import 'package:go_router/go_router.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/screen/Locallization.dart';
import 'package:untitled/view/screen/Onboadind.dart';
import 'package:untitled/view/screen/auth/Login.dart';
import 'package:untitled/view/screen/auth/Signup.dart';
import 'package:untitled/view/screen/auth/check_code.dart';
import 'package:untitled/view/screen/forget_password/check_code.dart';
import 'package:untitled/view/screen/forget_password/forget_password.dart';
import 'package:untitled/view/screen/auth/success_page.dart';
import 'package:untitled/view/screen/forget_password/resetpassword.dart';
import 'package:untitled/view/screen/forget_password/success_page.dart';
import 'package:untitled/view/screen/test.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const Login()
      // const Language()
      // getIt<CacheHelper>().getData(key: 'onbourding') == true
      //     ? const Language()
      //     : const Onboading(),
      ),
  GoRoute(
    path: "/Login",
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    path: "/Locallization",
    builder: (context, state) => const Language(),
  ),
  GoRoute(
    path: "/Onboading",
    builder: (context, state) => const Onboading(),
  ),
  GoRoute(
    path: "/Sign_up",
    builder: (context, state) => const Sign_up(),
  ),
  GoRoute(
    path: "/Success_page",
    builder: (context, state) => const Success_page(),
  ),
  GoRoute(
    path: "/Check_Code",
    builder: (context, state) => const Check_Code(),
  ),
  GoRoute(
    path: "/forget_password",
    builder: (context, state) => const forget_password(),
  ),
  GoRoute(
    path: "/ResetPassword",
    builder: (context, state) => const ResetPassword(),
  ),
  // GoRoute(
  //   path: "/Success_page2",
  //   builder: (context, state) => const Success_page2(),
  // ),
  GoRoute(
    path: "/Check_Code2",
    builder: (context, state) => const Check_Code2(),
  ),
]);

void push(context, String path) {
  GoRouter.of(context).push(path);
}

void pushpushReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
