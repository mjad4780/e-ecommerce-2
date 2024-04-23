import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_cart/cart_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/function/show.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/widget/cart/appbarcart.dart';
import 'package:untitled/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:untitled/view/widget/cart/customitemscartlist.dart';
import 'package:untitled/view/widget/cart/topcardcart.dart';

import '../../../core/function/showSnacpar.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartCubit(networkInfo: getIt<NetworkInfoImpl>())..GETCart(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is NodataCoupon) {
            showMyDialog(context);
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<CartCubit>(context);

          return Scaffold(
            bottomNavigationBar: BottomNavgationBarCart(
              onApplyCoupon: () => cubit.CeckCoupon(),
              price: cubit.getTotalPrice().toString(),
              shipping: "",
              totalprice: cubit.Totalprice.toString(),
              discount: cubit.discount.toString() ?? '0',
              controllercoupon: cubit.coupon,
            ),
            body: HandlingDataView(
                statusReqest1: cubit.statusReqest!,
                widget: ListView(
                  children: [
                    const SizedBox(height: 10),
                    TopCardCart(
                        message:
                            "You Have ${cubit.itemcount} Items in Your List"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                              cubit.mycart.length,
                              (i) => CustomItemsCartList(
                                    name: '${cubit.mycart[i].itemsName}',
                                    price:
                                        '${cubit.mycart[i].Itemprice_discount}',
                                    count: '${cubit.mycart[i].countitems}',
                                    imagename: '${cubit.mycart[i].itemsImage}',
                                    onAdd: () async {
                                      await cubit.Add(cubit.mycart[i].itemsId!);
                                      await cubit.GETCart();
                                    },
                                    onRemove: () async {
                                      await cubit
                                          .deleteCart(cubit.mycart[i].itemsId!);
                                      await cubit.GETCart();
                                    },
                                  )),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
