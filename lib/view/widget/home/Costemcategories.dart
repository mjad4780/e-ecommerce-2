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

    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        return Scaffold(
            body: SizedBox(
          height: 130,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cubit.dataCategories233.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // cubit.i = index;
                        // Navigaton(context, const Item_categories());
                        // cubit.CategoriesItemGetDate(
                        //     dataCategories[index].categoriesId!);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.thirdColor,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 70,
                        width: 70,
                        child: Image.network(
                          "${EndPoint.image_cat}/${cubit.dataCategories233[index].categoriesImage.toString()}",
                        ),
                      ),
                    ),
                    Text(
                      cubit.dataCategories233[index].categoriesName.toString(),
                      style:
                          const TextStyle(fontSize: 13, color: AppColor.black),
                    )
                  ],
                ),
              );
            },
          ),
        ));
      },
    );
  }
}

class name2 extends StatelessWidget {
  const name2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state is Successhome2) {
          return const CostemCategories();
        } else if (state is NodataHome) {
          return const CostemCategories();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
