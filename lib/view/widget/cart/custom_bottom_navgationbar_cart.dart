import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/widget/cart/buttoncart.dart';

import '../../../controller/cubit_Adress/adress_cubit.dart';
import 'InputCoupon.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  final void Function()? onPressedButtonCart;

  final String discount;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalprice,
      required this.discount,
      required this.controllercoupon,
      this.onApplyCoupon,
      this.onPressedButtonCart});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputCoupon(
            controller: controllercoupon,
            onPressed: onApplyCoupon,
          ),
          const SizedBox(height: 5),
          Container(
              child: const Text(
            "Coupon Code ",
            style: TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 60),
          Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("price",
                              style: TextStyle(fontSize: 16))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$price \$",
                              style: const TextStyle(fontSize: 16)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("discount",
                              style: TextStyle(fontSize: 16))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$discount \$",
                              style: const TextStyle(fontSize: 16)))
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11),
                    child: Divider(), // هو خط يفصل بين اثنين
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("Total Price",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor))),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("$totalprice \$",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor)))
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )),
          const SizedBox(height: 10),
          CustomButtonCart(
              textbutton: "Place Order", onPressed: onPressedButtonCart),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
