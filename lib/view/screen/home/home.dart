import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';
import 'package:untitled/view/widget/home/CostemProductHome.dart';
import 'package:untitled/view/widget/home/Costemcategories.dart';
import 'package:untitled/view/widget/home/DusCount.dart';
import 'package:untitled/view/widget/home/NameText.dart';
import 'package:untitled/view/widget/home/SearchAndNotifications.dart';
import 'package:untitled/view/widget/items/CardSearch.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomePageCubit>(context);
          return Container(
            padding: const EdgeInsets.all(8),
            child: ListView(children: [
              SearchAndNotifications(
                hint: ' search peoduct',
                controller: cubit.searchcontroller,
                onChanged: (val) {
                  cubit.mysearch(val);
                  print(val);
                },
                onPressed: () {
                  print('object');

                  cubit.playsearch();
                },
              ),
              HandlingDataView(
                  statusReqest1: cubit.statusReqest!,
                  widget: !cubit.search
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DisCount(),
                            NameText(text: 'Categories'),
                            CostemCategories(),
                            NameText(text: 'Product for you'),
                            CostemProductHome(),
                          ],
                        )
                      : ListItemsSearch(
                          listdatamodel: cubit.mysearchdata,
                        ))
            ]),
          );
        });
  }
}
