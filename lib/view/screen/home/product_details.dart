import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_cart/cart_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/widget/product_datauiles/CostemBottomNavigation.dart';
import 'package:untitled/view/widget/product_datauiles/body_product.dart';
import 'package:untitled/view/widget/product_datauiles/priceandcount.dart';
import 'package:untitled/view/widget/product_datauiles/subitemslist.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(networkInfo: getIt<NetworkInfoImpl>())
        ..currentcart(itemsModel.itemsId!),
      child: Scaffold(
          bottomNavigationBar: const CostemNavigation(),
          body: ListView(children: [
            BodyProduct(
              itemsModel: itemsModel,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: SubitemsList(),
            )
          ])),
    );
  }
}
