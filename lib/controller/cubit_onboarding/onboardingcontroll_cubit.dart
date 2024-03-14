import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/data/model/onbording.dart';

import '../../my core/Navigator/Navigator.dart';

part 'onboardingcontroll_state.dart';

class OnboardingcontrollCubit extends Cubit<OnboardingcontrollState> {
  OnboardingcontrollCubit() : super(OnboardingcontrollInitial());
  PageController pageController = PageController();
  int current = 0;

  onpagechanged(int index) {
    current = index;
    emit(Onboardingcontroll());
  }

  next() {
    current++;
    pageController.animateToPage(current,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
    emit(OnboardingNext());
  }
}
