import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Adress/adress_cubit.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/controller/cubit_cart/cart_cubit.dart';
import 'package:untitled/controller/cubit_forget/forget_password_cubit.dart';
import 'package:untitled/controller/cubit_translate/translate_cubit.dart';
import 'package:untitled/core/function/show.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/widget/Materialapp/Materialapp.dart';
import 'controller/cubit_Order/order_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServise();
  await getIt<CacheHelper>().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                AdressCubit(getIt<DioConsumer>())..getLating()),
        BlocProvider(
            create: (context) => HomePageCubit(
                Api: getIt<DioConsumer>(),
                networkInfo: getIt<NetworkInfoImpl>())
              ..GetFavorite()
              ..getDate()
              ..determinePosition()
              ..firemessage()
              ..firebase(context)),
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
                CartCubit(networkInfo: getIt<NetworkInfoImpl>())),
        BlocProvider(create: (context) => OrderCubit()),
      ],
      child: const MaterialApp2(),
    );
  }
}

// class name extends StatelessWidget {
//   const name({super.key});
//   cxz() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//               height: 100,
//               width: double.infinity,
//               child: Center(
//                   child: GestureDetector(
//                       onTap: () {
//                         getIt<CacheHelper>().clearData();
//                       },
//                       child: const Icon(Icons.delete)))),
//         ],
//       ),
//     );
//   }
// }

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text('Snackbar'),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                final snackbar = SnackBar(
                    showCloseIcon: true,
                    dismissDirection: DismissDirection.vertical,
                    action: SnackBarAction(
                      label: 'Undo',
                      textColor: Colors.blue,
                      onPressed: () {},
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    behavior: SnackBarBehavior.floating,
                    // padding: EdgeInsets.all(20),

                    duration: const Duration(milliseconds: 3000),
                    // backgroundColor: Colors.red,
                    content: const Text('This is an error'));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: const Text('Show Snackbar')),
        ),
      ),
    );
  }
}
