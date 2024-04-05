import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/view/widget/cart/buttoncart.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalprice;
  const BottomNavgationBarCart(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalprice});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("price", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("$price \$", style: const TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("shipping", style: TextStyle(fontSize: 16))),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    Text("$shipping \$", style: const TextStyle(fontSize: 16)))
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
        CustomButtonCart(
          textbutton: "Place Order",
          onPressed: () {},
        )
      ],
    ));
  }
}
