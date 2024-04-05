import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_cart/cart_cubit.dart';

class TopAppbarCart extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const TopAppbarCart(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
            )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(fontSize: 25),
              ),
            )),
            const Spacer()
          ],
        ));
  }
}
