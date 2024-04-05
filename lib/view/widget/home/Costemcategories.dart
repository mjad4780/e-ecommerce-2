import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/categoriesmodel.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/view/screen/home/item_categories.dart';

class CostemCategories extends StatelessWidget {
  const CostemCategories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomePageCubit>(context);
    return SizedBox(
      height: 130,
      child: ListView.builder(
        itemCount: cubit.dataCategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    cubit.i = index;
                    Navigaton(context, const Item_categories());
                    cubit.CategoriesItemGetDate(
                        cubit.dataCategories[index].categoriesId!);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.thirdColor,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 70,
                    width: 70,
                    child: Image.network(
                      "${EndPoint.image_cat}/${cubit.dataCategories[index].categoriesImage.toString()}",
                    ),
                  ),
                ),
                Text(
                  cubit.dataCategories[index].categoriesName.toString(),
                  style: const TextStyle(fontSize: 13, color: AppColor.black),
                )
              ],
            ),
          );
        },
      ),
      // )
    );
  }
}
