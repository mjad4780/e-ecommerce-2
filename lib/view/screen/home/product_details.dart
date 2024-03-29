import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/view/widget/product_datauiles/CostemBottomNavigation.dart';
import 'package:untitled/view/widget/product_datauiles/body_product.dart';
import 'package:untitled/view/widget/product_datauiles/priceandcount.dart';
import 'package:untitled/view/widget/product_datauiles/subitemslist.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CostemNavigation(),
        body: ListView(children: [
          BodyProduct(
            itemsModel: itemsModel,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SubitemsList(),
          )
        ]));
  }
}
