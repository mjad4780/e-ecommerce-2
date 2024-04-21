import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/data/model/addressmodel.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/screen/address/edit.dart';
import 'package:untitled/view/widget/Adress/CardAdress.dart';

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
                    push(context, '/AddressAddMaps');
                  },
                  child: const Icon(Icons.add)),
              body: HandlingDataView(
                statusReqest1: cubit.statusReqest!,
                widget: ListView.builder(
                  itemCount: cubit.getadrees.length,
                  itemBuilder: (context, i) {
                    return CardAddress(
                      onedit: () {
                        navigaton(
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
              ));
        },
      ),
    );
  }
}
