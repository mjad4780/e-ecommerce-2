import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Order/order_cubit.dart';

import '../../widget/checkout/orderslistcard.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: BlocProvider(
          create: (context) => OrderCubit()..getOrders(),
          child: BlocConsumer<OrderCubit, OrderState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<OrderCubit>(context);

              return Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: cubit.data.length,
                    itemBuilder: ((context, index) => CardOrdersList(
                          listdata: cubit.data[index],
                          orderCubit: cubit,
                        )),
                  ));
            },
          ),
        ));
  }
}
