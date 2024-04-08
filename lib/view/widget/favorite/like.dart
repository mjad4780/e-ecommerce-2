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
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomePageCubit>(context);

        return Container(
          child: IconButton(
              icon: cubit.itemid.contains(itemsModel.itemsId)
                  ? const Icon(
                      Icons.favorite,
                      color: AppColor.primaryColor,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      color: AppColor.primaryColor,
                    ),
              onPressed: () {
                if (cubit.itemid.contains(itemsModel.itemsId)) {
                  cubit.RemoveFavorite(itemsModel.itemsId!);
                  cubit.itemid
                      .removeWhere((element) => element == itemsModel.itemsId);
                } else {
                  cubit.AddFavorite(itemsModel.itemsId!);
                }
              }),
        );
      },
      // ),
    );
  }
}
