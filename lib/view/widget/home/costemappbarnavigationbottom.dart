import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/data/model/modelBottomNavigation.dart';
import 'package:untitled/view/widget/home/CostemBottomNavigation.dart';

class costemappbarnavigationbottom extends StatelessWidget {
  const costemappbarnavigationbottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomePageCubit>(context);
          return BottomAppBar(
            height: 70,
            shape: const CircularNotchedRectangle(),
            notchMargin: 11,
            surfaceTintColor: Colors.red,
            child: Row(
              children: [
                ...List.generate(cubit.botteon.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CostemBottomNavigation(
                          iconData: bottomNavigation[i].iconData,
                          text: bottomNavigation[i].title,
                          onPressed: () {
                            cubit.currentPage(i);
                          },
                          active: cubit.current == i ? true : false);
                })
              ],
            ),
          );
        });
  }
}
