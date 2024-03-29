import 'package:flutter/material.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/view/widget/product_datauiles/priceandcount.dart';
import 'package:untitled/view/widget/product_datauiles/subitemslist.dart';

class BodyProduct extends StatelessWidget {
  const BodyProduct({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            height: 180,
            child: Image.network(
              '${EndPoint.image_item}/${itemsModel.itemsImage}',
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Text("${itemsModel.itemsName}",
            style: const TextStyle(
                color: Color.fromARGB(255, 34, 32, 32),
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        PriceAndCountItems(
            onAdd: () {},
            onRemove: () {},
            price: itemsModel.itemsPrice.toString(),
            count: itemsModel.itemsCount.toString()),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11),
          child: Text('${itemsModel.itemsDesc}',
              style: const TextStyle(
                  height: 1.6,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 34, 32, 32))),
        ),
        const SizedBox(height: 90),
      ]),
    );
  }
}
