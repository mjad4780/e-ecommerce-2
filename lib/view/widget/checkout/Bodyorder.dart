import 'package:flutter/material.dart';
import 'package:untitled/view/widget/checkout/cardpaymentmethod.dart';
import '../../../controller/cubit_Adress/adress_cubit.dart';
import '../../../controller/cubit_Order/order_cubit.dart';
import '../../../core/constans/Color.dart';
import '../../../data/datasourse/static/assets.dart';
import 'AdressDataCheckout.dart';
import 'carddeliveerytype.dart';

class Bodyorder extends StatelessWidget {
  const Bodyorder({super.key, required this.cubit1, required this.cubit});
  final OrderCubit cubit1;
  final AdressCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Choose Payment Method",
              style: TextStyle(
                  color: AppColor.secondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                cubit1.choosePaymentMethod(0);
              },
              child: CardPaymentMethodCheckout(
                  title: "Cash On Delivery",
                  isActive: cubit1.paymentMethod == 0 ? true : false),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                cubit1.choosePaymentMethod(1);
              },
              child: CardPaymentMethodCheckout(
                  title: "Payment Cards",
                  isActive: cubit1.paymentMethod == 1 ? true : false),
            ),
            const SizedBox(height: 20),
            const Text(
              "Choose Delivery Type",
              style: TextStyle(
                  color: AppColor.secondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    cubit1.chooseDeliveryType(0);
                    if (cubit.getadrees.isEmpty) {
                      cubit.adressget();
                    }
                  },
                  child: CardDeliveryTypeCheckout(
                      imagename: Assets.images005DeliveryMan,
                      title: "Delivery",
                      active: cubit1.deliveryType == 0 ? true : false),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    cubit1.chooseDeliveryType(1); // 1 => recive
                    cubit1.chooseShippingAddress(0);
                  },
                  child: CardDeliveryTypeCheckout(
                      imagename: Assets.imagesDrivethru,
                      title: "Revice",
                      active: cubit1.deliveryType == 1 ? true : false),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (cubit1.deliveryType == 0)
              AdressDataCheckout(
                cubit1: cubit1,
                cubit: cubit,
              )
          ],
        ));
  }
}
