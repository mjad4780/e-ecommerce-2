import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                  imageUrl: '${EndPoint.image_item}/$imagename')),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 40,
                  child: IconButton(
                      onPressed: onAdd, icon: const Icon(Icons.add))),
              SizedBox(
                  height: 30,
                  child: Text(count, style: const TextStyle(fontSize: 20))),
              SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove, icon: const Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}
