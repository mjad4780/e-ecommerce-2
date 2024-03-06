import 'package:go_router/go_router.dart';
import 'package:untitled/core/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my%20core/get_it/get_it.dart';
import 'package:untitled/main.dart';
import 'package:untitled/view/screen/Onboadind.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) =>
        getIt<CacheHelper>().getData(key: 'onbourding') == true
            ? const name()
            : const Onboading(),
  ),
  GoRoute(
    path: "/name",
    builder: (context, state) => const name(),
  ),
  // GoRoute(
  //   path: "/Login",
  //   builder: (context, state) => Login(),
  // ),
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
