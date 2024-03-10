import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_onboarding/onboardingcontroll_cubit.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';
import 'package:untitled/data/model/onbording.dart';

class Controller_page extends StatelessWidget {
  const Controller_page({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnboardingcontrollCubit>(context);

    return BlocConsumer<OnboardingcontrollCubit, OnboardingcontrollState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onboidin.length,
                (i) => AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      margin: const EdgeInsets.all(6),
                      width: cubit.current == i ? 22 : 6,
                      height: 6,
                      color: ColorManager.primaryColor,
                    ))
          ],
        );
      },
    );
  }
}
