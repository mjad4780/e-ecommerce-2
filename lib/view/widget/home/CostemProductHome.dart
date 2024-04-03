import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/view/screen/home/product_details.dart';
import 'package:untitled/view/widget/favorite/like.dart';

class CostemProductHome extends StatelessWidget {
  const CostemProductHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<HomePageCubit>(context);

        return SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: cubit.dataItem.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // cubit.api();
                  // push(context, '/ProductDetails');
                  Navigaton(
                      context,
                      ProductDetails(
                        itemsModel: cubit.dataItem[index],
                      ));
                },
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 11),
                      child: Image.network(
                        '${EndPoint.image_item}/${cubit.dataItem[index].itemsImage}',
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(22)),
                      width: 160,
                      height: 120,
                    ),
                    Positioned(
                        top: 9,
                        left: 4,
                        child: Text(
                          cubit.dataItem[index].itemsName!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                    Likke(
                      itemsModel: cubit.dataItem[index],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
