import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/controller/cubit_Order/order_cubit.dart';
import 'package:untitled/core/constans/Color.dart';
import '../../../controller/cubit_Adress/adress_cubit.dart';
import '../../widget/checkout/Bodyorder.dart';

class CheckOrder extends StatelessWidget {
  const CheckOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> hello =
        GoRouterState.of(context).extra! as Map<dynamic, dynamic>;
    final cubit = BlocProvider.of<AdressCubit>(context);
    final cubit1 = BlocProvider.of<OrderCubit>(context);

    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Checkout'),
          ),
          bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                color: AppColor.secondColor,
                textColor: Colors.white,
                onPressed: () {
                  cubit1.checkout(context, hello['totalprice'],
                      hello['coponid'], hello['disscount']);
                },
                child: const Text("Checkout",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              )),
          body: Bodyorder(
            cubit1: cubit1,
            cubit: cubit,
          ),
        );
      },
    );
  }
}
