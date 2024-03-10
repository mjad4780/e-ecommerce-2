import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_onboarding/onboardingcontroll_cubit.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
import 'package:untitled/core/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/core/my%20core/get_it/get_it.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';
import 'package:untitled/data/model/onbording.dart';

class costembotom extends StatelessWidget {
  const costembotom({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnboardingcontrollCubit>(context);

    return BlocConsumer<OnboardingcontrollCubit, OnboardingcontrollState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: MaterialButton(
            onPressed: () {
              if (cubit.current == onboidin.length - 1) {
                getIt<CacheHelper>().saveData(key: 'onbourding', value: true);
                pushpushReplacement(context, "/Login");
              } else {
                cubit.next();
              }
            },
            height: 40,
            minWidth: 333,
            color: ColorManager.primaryColor,
            child: Text('8'.tr(context)),
          ),
        );
      },
    );
  }
}
