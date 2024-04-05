import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/controller/cubit_cart/cart_cubit.dart';
import 'package:untitled/controller/cubit_forget/forget_password_cubit.dart';
import 'package:untitled/controller/cubit_translate/translate_cubit.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

import 'package:untitled/view/widget/Materialapp/Materialapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServise();
  await getIt<CacheHelper>().init();
  // HomePageCubit home = HomePageCubit(
  //     Api: getIt<DioConsumer>(), networkInfo: getIt<NetworkInfoImpl>());
  // await home.api();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomePageCubit(
                Api: getIt<DioConsumer>(),
                networkInfo: getIt<NetworkInfoImpl>())
              ..getDate()
              ..GetFavorite()),
        BlocProvider(
          create: (context) => TranslateCubit()..getsavedlanguage(),
        ),
        BlocProvider(
            create: (context) => AuthCubit(
                Api: getIt<DioConsumer>(),
                networkInfo: getIt<NetworkInfoImpl>())),
        BlocProvider(
            create: (context) => ForgetPasswordCubit(
                Api: getIt<DioConsumer>(),
                networkInfo: getIt<NetworkInfoImpl>())),
        BlocProvider(
            create: (context) =>
                CartCubit(networkInfo: getIt<NetworkInfoImpl>()))
      ],
      child: const MaterialApp2(),
    );
  }
}

class name extends StatelessWidget {
  const name({super.key});
  cxz() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 100,
              width: double.infinity,
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        getIt<CacheHelper>().clearData();
                      },
                      child: const Icon(Icons.delete)))),
        ],
      ),
    );
  }
}
