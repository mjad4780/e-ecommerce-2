import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Homepage/home_page_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/favorite.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class CustomListFavoriteItems extends StatelessWidget {
  final MyFavoriteModel itemsModel;
  // final bool active;
  const CustomListFavoriteItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomePageCubit>(context);

    return InkWell(
        onTap: () {
          // controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.network(
                  //   "${EndPoint.image_item}/${itemsModel.itemsImage}",
                  //   height: 100,
                  //   fit: BoxFit.fill,
                  // ),
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl:
                          "${EndPoint.image_item}/${itemsModel.itemsImage!}",
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("${itemsModel.itemsName}",
                      // translateDatabase(
                      //     itemsModel.itemsNameAr, itemsModel.itemsName),
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating 3.5 ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      size: 15,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModel.itemsPrice} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          onPressed: () {
                            // cubit.remove(itemsModel.itemsId.toString());

                            cubit.RemoveFavorite(itemsModel.itemsId!);
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ]),
          ),
        ));
  }
}
