import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
