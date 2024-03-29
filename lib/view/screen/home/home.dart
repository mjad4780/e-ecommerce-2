import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';
import 'package:untitled/view/widget/home/CostemProductHome.dart';
import 'package:untitled/view/widget/home/Costemcategories.dart';
import 'package:untitled/view/widget/home/DusCount.dart';
import 'package:untitled/view/widget/home/NameText.dart';
import 'package:untitled/view/widget/home/SearchAndNotifications.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomePageCubit>(context);
          return HandlingDataView(
            widget: Container(
              padding: const EdgeInsets.all(8),
              child: ListView(children: const [
                SearchAndNotifications(),
                DisCount(),
                NameText(text: 'Categories'),
                CostemCategories(),
                NameText(text: 'Product for you'),
                CostemProductHome()
              ]),
            ),
            statusReqest1: cubit.statusReqest!,
          );
        });
  }
}
