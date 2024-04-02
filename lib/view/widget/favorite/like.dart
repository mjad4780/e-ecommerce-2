import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';

class Likke extends StatelessWidget {
  const Likke({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<HomePageCubit>(context);

        return Container(
          child: IconButton(
              icon: cubit.ee.contains(itemsModel.itemsId.toString())
                  ? const Icon(
                      Icons.favorite,
                      color: AppColor.primaryColor,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      color: AppColor.primaryColor,
                    ),
              onPressed: () {
                if (cubit.ee.contains(itemsModel.itemsId.toString())) {
                  cubit.remove(itemsModel.itemsId.toString());
                  cubit.RemoveFavorite(itemsModel.itemsId!);
                } else {
                  cubit.insert(itemsModel.itemsId.toString());
                  cubit.AddFavorite(itemsModel.itemsId!);
                }
              }),
        );
      },
    );
  }
}
