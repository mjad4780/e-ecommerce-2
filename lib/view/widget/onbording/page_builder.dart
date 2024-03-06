import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit/onboardingcontroll_cubit.dart';
import 'package:untitled/data/model/onbording.dart';

class page_builder extends StatelessWidget {
  const page_builder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnboardingcontrollCubit>(context);

    return PageView.builder(
        controller: cubit.pageController,
        onPageChanged: (value) {
          cubit.onpagechanged(value);
        },
        itemCount: onboidin.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                onboidin[index].title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 120,
              ),
              Image(
                image: AssetImage(
                  onboidin[index].path,
                ),
                width: 300,
                height: 280,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    onboidin[index].des,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 2,
                    ),
                  ))
            ],
          );
        });
  }
}
