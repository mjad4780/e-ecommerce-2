import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_Adress/adress_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/widget/Auth/custombuttonauth.dart';

import '../../widget/Auth/customtextformauth.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: BlocConsumer<AdressCubit, AdressState>(
        listener: (context, state) {
          if (state is addAdresssuccess) {
            pushpushReplacement(context, '/Home_page');
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AdressCubit>(context);

          return HandlingDataView(
              statusReqest1: cubit.statusReqest!,
              widget: Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(children: [
                    CustomTextFormAuth(
                        hinttext: "city",
                        labeltext: "city",
                        iconData: Icons.location_city,
                        mycontroller: cubit.cityadd,
                        valid: (val) {
                          return null;
                        },
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "street",
                        labeltext: "street",
                        iconData: Icons.streetview,
                        mycontroller: cubit.nemeadd,
                        valid: (val) {
                          return null;
                        },
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "name",
                        labeltext: "name",
                        iconData: Icons.near_me,
                        mycontroller: cubit.streetadd,
                        valid: (val) {
                          return null;
                        },
                        isNumber: false),
                    CustomButtomAuth(
                      text: "Add",
                      onPressed: () {
                        cubit.adressaddd();
                      },
                    )
                  ])));
        },
      ),
    );
  }
}
