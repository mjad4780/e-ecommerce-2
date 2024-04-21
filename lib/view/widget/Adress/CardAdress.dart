import 'package:flutter/material.dart';
import 'package:untitled/data/model/addressmodel.dart';

class CardAddress extends StatelessWidget {
  final void Function()? onDelete;
  final void Function()? onedit;
  final AddressModel addressModel;
  const CardAddress(
      {super.key, this.onDelete, this.onedit, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity} ${addressModel.addressStreet}"),
            trailing: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_outline)),
                  const SizedBox(
                    width: 4,
                  ),
                  IconButton(onPressed: onedit, icon: const Icon(Icons.edit)),
                ],
              ),
            ),
          )),
    );
  }
}
