import 'package:go_router/go_router.dart';
import 'package:untitled/core/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my%20core/get_it/get_it.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/screen/Locallization.dart';
import 'package:untitled/view/screen/Onboadind.dart';
import 'package:untitled/view/screen/auth/Login.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) =>
        getIt<CacheHelper>().getData(key: 'onbourding') == true
            ? const Language()
            : const Onboading(),
  ),
  GoRoute(
    path: "/Login",
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    path: "/Locallization",
    builder: (context, state) => const Language(),
  ),
  // GoRoute(
  //   path: "/Rigster",
  //   builder: (context, state) => Rigster(),
  // ),
  // GoRoute(
  //   path: "/Onboirding",
  //   builder: (context, state) => Onboirding(),
  // ),
  // GoRoute(
  //   path: "/forget_password",
  //   builder: (context, state) => forget_password(),
  // ),
  // GoRoute(
  //   path: "/profile",
  //   builder: (context, state) => profile(),
  // ),
  // GoRoute(
  //   path: "/Home_start_Bottom",
  //   builder: (context, state) => Home_start_Bottom(),
  // ),
  // GoRoute(
  //   path: "/productCategories",
  //   builder: (context, state) => productCategories(),
  // ),
]);

void push(context, String path) {
  GoRouter.of(context).push(path);
}

void pushpushReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
