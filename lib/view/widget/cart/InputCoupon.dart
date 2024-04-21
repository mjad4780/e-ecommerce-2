import 'package:flutter/material.dart';
import 'package:untitled/view/widget/cart/CostemTextField.dart';

class InputCoupon extends StatelessWidget {
  const InputCoupon({super.key, required this.controller, this.onPressed});
  final TextEditingController controller;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          Expanded(
              flex: 2,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    hintText: "Coupon Code",
                    border: OutlineInputBorder()),
              )),
          const SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: CustomButtonCoupon(
              textbutton: "apply",
              onPressed: onPressed,
            ),
          )
        ]));
  }
}
