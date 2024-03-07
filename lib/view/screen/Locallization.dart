import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_translate/translate_cubit.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';
import 'package:untitled/view/widget/Language/languagebotom.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      drawer: const Drawer(),
      body: BlocConsumer<TranslateCubit, TranslateState>(
        listener: (context, state) {
          pushpushReplacement(context, '/Login');
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<TranslateCubit>(context);
          if (state is ChangeLocalState) {
            return Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.translate('kkkk'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  botom_language(
                    language: 'Arabic',
                    onPressed: () {
                      cubit.changelanguage('ar');
                    },
                  ),
                  botom_language(
                    language: 'English',
                    onPressed: () {
                      cubit.changelanguage('en');
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
