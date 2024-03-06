import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit/onboardingcontroll_cubit.dart';
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
        return cubit.current == onboidin.length - 1
            ? Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: MaterialButton(
                  onPressed: () {
                    getIt<CacheHelper>()
                        .saveData(key: 'onbourding', value: true);
                    pushpushReplacement(context, '/name');
                  },
                  height: 40,
                  minWidth: 333,
                  color: ColorManager.blue,
                  child: const Text('next'),
                ),
              )
            : Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: MaterialButton(
                  onPressed: () {
                    cubit.next();
                  },
                  height: 40,
                  minWidth: 333,
                  color: ColorManager.blue,
                  child: const Text('contenu'),
                ),
              );
      },
    );
  }
}
