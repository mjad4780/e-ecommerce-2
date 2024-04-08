import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/data/model/addressmodel.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/screen/address/edit.dart';

import '../../../controller/cubit_Adress/adress_cubit.dart';
import '../../../my core/databases/api/dio_consumer.dart';
import '../../../my core/get_it/get_it.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdressCubit(getIt<DioConsumer>())..adressget(),
      child: BlocConsumer<AdressCubit, AdressState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<AdressCubit>(context);

          return Scaffold(
              appBar: AppBar(
                title: Text(cubit.getadrees.length.toString()),
              ),
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    cubit.statusReqest = StatusReqest.none;
                    push(context, '/AddressAddDetails');
                    // Get.toNamed(AppRoute.addressadd);
                  },
                  child: const Icon(Icons.add)),
              body: HandlingDataView(
                statusReqest1: cubit.statusReqest!,
                widget: Container(
                  child: ListView.builder(
                    itemCount: cubit.getadrees.length,
                    itemBuilder: (context, i) {
                      return CardAddress(
                        onedit: () {
                          Navigaton(
                              context,
                              EditressAddDetails(
                                city: cubit.getadrees[i].addressCity!,
                                name: cubit.getadrees[i].addressName!,
                                street: cubit.getadrees[i].addressStreet!,
                                id: cubit.getadrees[i].addressId,
                              ));
                        },
                        onDelete: () {
                          cubit.adressdelete(cubit.getadrees[i].addressId!);
                        },
                        addressModel: cubit.getadrees[i],
                      );
                    },
                  ),
                ),
              ));
        },
      ),
    );
  }
}

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
