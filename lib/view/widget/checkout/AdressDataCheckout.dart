import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit_Adress/adress_cubit.dart';
import '../../../controller/cubit_Order/order_cubit.dart';
import '../../../core/constans/Color.dart';
import 'cardshippingaddress.dart';

class AdressDataCheckout extends StatelessWidget {
  const AdressDataCheckout(
      {super.key, required this.cubit1, required this.cubit});
  final OrderCubit cubit1;
  final AdressCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdressCubit, AdressState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Shipping Address",
              style: TextStyle(
                  color: AppColor.secondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              cubit.getadrees.length,
              (index) => InkWell(
                  onTap: () {
                    cubit1.chooseShippingAddress(
                        cubit.getadrees[index].addressId!);
                  },
                  child: CardShppingAddressCheckout(
                      title: "${cubit.getadrees[index].addressName}",
                      body:
                          "${cubit.getadrees[index].addressCity} ${cubit.getadrees[index].addressStreet}",
                      isactive:
                          cubit1.addressid == cubit.getadrees[index].addressId
                              ? true
                              : false)),
            )
          ],
        );
      },
    );
  }
}
