import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/widget/favorite/CostemFavoriteItem.dart';
import 'package:untitled/view/widget/home/SearchAndNotifications.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(
          Api: getIt<DioConsumer>(), networkInfo: getIt<NetworkInfoImpl>())
        ..GetFavorite(),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.white,
        child: ListView(
          children: [
            // const SearchAndNotifications(),
            BlocConsumer<HomePageCubit, HomePageState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final cubit = BlocProvider.of<HomePageCubit>(context);

                return HandlingDataView(
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.myfavorite.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItems(
                          itemsModel: cubit.myfavorite[index]);
                    },
                  ),
                  statusReqest1: cubit.statusReqest!,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
