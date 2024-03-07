import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my%20core/get_it/get_it.dart';

part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit() : super(TranslateInitial());

  Future<void> getsavedlanguage() async {
    final String cachedLanguage =
        await getIt<CacheHelper>().getCachedlanguagecode();
    emit(ChangeLocalState(locale: Locale(cachedLanguage)));
    //   locale: وبل الاخص عندMaterialApp وتوديها عند  Cacheسوف تاخذ القيمه من emitفائدت
  }

  Future<void> changelanguage(String languagecode) async {
    await getIt<CacheHelper>().Cachedlanguagecode(languagecode);
    emit(ChangeLocalState(locale: Locale(languagecode)));
  }
}
