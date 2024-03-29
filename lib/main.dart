import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/controller/cubit_translate/translate_cubit.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/screen/Onboadind.dart';
import 'package:untitled/view/widget/Materialapp/Materialapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          create: (context) => TranslateCubit()..getsavedlanguage(),
        ),
        BlocProvider(create: (context) => AuthCubit())
      ],
      child: const MaterialApp2(),
    );
  }
}

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: 100,
          width: double.infinity,
          child: Center(
              child: GestureDetector(
                  onTap: () {
                    getIt<CacheHelper>().clearData();
                  },
                  child: const Icon(Icons.delete)))),
    );
  }
}

    // OtpTextField(
    //     numberOfFields: 5,
    //     borderColor: Color(0xFF512DA8),
    //     //set to true to show as box or false to show as dash
    //     showFieldAsBox: true, 
    //     //runs when a code is typed in
    //     onCodeChanged: (String code) {
    //         //handle validation or checks here           
    //     },
    //     //runs when every textfield is filled
    //     onSubmit: (String verificationCode){
    //         showDialog(
    //             context: context,
    //             builder: (context){
    //             return AlertDialog(
    //                 title: Text("Verification Code"),
    //                 content: Text('Code entered is $verificationCode'),
    //             );
    //             }
    //         );
    //     }, // end onSubmit
    // ),