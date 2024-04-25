import 'package:flutter/material.dart';

import '../../../controller/cubit_Order/order_cubit.dart';
import '../../../core/constans/Color.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersList extends StatelessWidget {
  final OrdersModel listdata;
  final OrderCubit orderCubit;
  const CardOrdersList(
      {super.key, required this.listdata, required this.orderCubit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  // Text(
                  //   // Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                  //   style: const TextStyle(
                  //       color: AppColor.primaryColor,
                  //       fontWeight: FontWeight.bold),
                  // )
                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${orderCubit.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${orderCubit.printPaymentMethod(listdata.ordersPaymentmethod.toString())} "),
              Text(
                  "Order Status : ${orderCubit.printOrderStatus(listdata.ordersStatus.toString())} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersTotalprice} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      // Get.toNamed(AppRoute.ordersdetails,
                      //     arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  const SizedBox(width: 10),
                  if (listdata.ordersStatus! == 0)
                    MaterialButton(
                      onPressed: () {
                        // controller.deleteOrder(listdata.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: const Text("Delete"),
                    )
                ],
              ),
            ],
          )),
    );
  }
}
