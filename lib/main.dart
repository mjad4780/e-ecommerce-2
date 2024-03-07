import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/controller/cubit_translate/translate_cubit.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/core/my core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my core/get_it/get_it.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
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
    return BlocProvider(
        create: (context) => TranslateCubit()..getsavedlanguage(),
        child: const MaterialApp2());
  }
}

// class name extends StatelessWidget {
//   const name({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//           height: 100,
//           width: double.infinity,
//           child: Center(
//               child:
//                   Text(AppLocalizations.of(context)!.translate('hello_msg')))),
//     );
//   }
// }
