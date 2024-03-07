import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/controller/cubit_translate/translate_cubit.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';

class MaterialApp2 extends StatelessWidget {
  const MaterialApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateCubit, TranslateState>(
      builder: (context, state) {
        if (state is ChangeLocalState) {
          return MaterialApp.router(
            locale: state.locale,
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
        return const SizedBox();
      },
    );
  }

  ThemeData Themes() {
    return ThemeData(
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)));
  }
}
