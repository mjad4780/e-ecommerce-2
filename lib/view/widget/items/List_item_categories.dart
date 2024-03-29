import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/data/model/categoriesmodel.dart';

class ListCategoriesItems extends StatelessWidget {
  const ListCategoriesItems({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<HomePageCubit>(context);
          return SizedBox(
            height: 60,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: cubit.dataCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Categories(
                  categoriesModel: cubit.dataCategories[index],
                  cubit1: cubit,
                  i1: index,
                );
              },
            ),
          );
        });
  }
}

class Categories extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int i1;
  final HomePageCubit cubit1;
  const Categories({
    super.key,
    required this.categoriesModel,
    required this.cubit1,
    required this.i1,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        cubit1.very_i(i1);
        cubit1.CategoriesItemGetDate(categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
            decoration: cubit1.i == i1
                ? const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor)))
                : null,
            child: Text(
              "${categoriesModel.categoriesName}",
              style: const TextStyle(fontSize: 20, color: AppColor.grey),
            ),
          )
        ],
      ),
    );
  }
}
