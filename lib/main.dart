import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/core/my core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my core/get_it/get_it.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/screen/Onboadind.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: Themes(),
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (devicelocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (devicelocale != null &&
              devicelocale.languageCode == locale.languageCode) {
            return devicelocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }

  ThemeData Themes() {
    return ThemeData(
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)));
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
              child:
                  Text(AppLocalizations.of(context)!.translate('hello_msg')))),
    );
  }
}
