import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/view/screen/home/product_details.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigaton(context, ProductDetails(itemsModel: itemsModel));
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // tag: "{itemsModel.itemsId}",
                  Image.network(
                    "${EndPoint.image_item}/${itemsModel.itemsImage!}",
                    height: 90,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                  //  CachedNetworkImage(
                  //  // imageUrl: AppLink.imagestItems + "/" + itemsModel.itemsImage!,
                  //   height: 100,
                  //   fit: BoxFit.fill,
                  // ),

                  const SizedBox(height: 10),
                  Container(
                    child: Text('${itemsModel.itemsName}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
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
                      const Text("200\$",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ]),
          ),
        ));
  }
}
