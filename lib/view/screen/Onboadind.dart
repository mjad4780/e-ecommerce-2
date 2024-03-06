import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit/onboardingcontroll_cubit.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';

import 'package:untitled/data/model/onbording.dart';
import 'package:untitled/view/widget/onbording/Costembotom.dart';
import 'package:untitled/view/widget/onbording/controller_page.dart';

import '../widget/onbording/page_builder.dart';

class Onboading extends StatelessWidget {
  const Onboading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnboardingcontrollCubit(),
        child: BlocConsumer<OnboardingcontrollCubit, OnboardingcontrollState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = BlocProvider.of<OnboardingcontrollCubit>(context);
            return const SafeArea(
              child: Column(
                children: [
                  Expanded(flex: 3, child: page_builder()),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Controller_page(),
                          SizedBox(
                            height: 22,
                          ),
                          costembotom()
                        ],
                      )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
