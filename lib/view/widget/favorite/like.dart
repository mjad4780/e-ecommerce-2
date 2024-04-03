import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

class Likke extends StatelessWidget {
  const Likke({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(
          Api: getIt<DioConsumer>(), networkInfo: getIt<NetworkInfoImpl>())
        ..GetFavorite(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
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
                    cubit.itemid.removeWhere(
                        (element) => element == itemsModel.itemsId);
                    // cubit.GetFavorite();
                  } else {
                    cubit.AddFavorite(itemsModel.itemsId!);
                    // cubit.GetFavorite();
                  }
                  // cubit.GetFavorite();
                }),
          );
        },
      ),
    );
  }
}
