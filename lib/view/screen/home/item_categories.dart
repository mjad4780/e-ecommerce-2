import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/view/widget/items/List_item_categories.dart';
import 'package:untitled/view/widget/items/item_categories.dart';

import '../../widget/home/SearchAndNotifications.dart';

class Item_categories extends StatelessWidget {
  const Item_categories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomePageCubit>(context);

    return Scaffold(
        body: BlocConsumer<HomePageCubit, HomePageState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(children: [
                    const SearchAndNotifications(),
                    const SizedBox(height: 20),
                    const ListCategoriesItems(),
                    HandlingDataView(
                        statusReqest1: cubit.statusReqest!,
                        widget: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cubit.categoriesItemData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8), //Cardطول
                          itemBuilder: (BuildContext context, index) {
                            return CustomListItems(
                              itemsModel: cubit.categoriesItemData[index],
                            );
                          },
                        ))
                  ]));
            }));
  }
}
