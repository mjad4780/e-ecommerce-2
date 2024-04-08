import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/widget/Auth/custombuttonauth.dart';

import '../../../controller/cubit_Adress/adress_cubit.dart';
import '../../widget/Auth/customtextformauth.dart';

class EditressAddDetails extends StatefulWidget {
  const EditressAddDetails(
      {super.key,
      required this.city,
      required this.name,
      required this.street,
      required this.id});
  final String city;
  final String name;
  final String street;
  final id;

  @override
  State<EditressAddDetails> createState() => _EditressAddDetailsState();
}

class _EditressAddDetailsState extends State<EditressAddDetails> {
  TextEditingController nemeedit = TextEditingController();
  TextEditingController cityedit = TextEditingController();
  TextEditingController streetedit = TextEditingController();
  @override
  void initState() {
    nemeedit.text = widget.name;
    cityedit.text = widget.city;
    streetedit.text = widget.street;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit details address'),
      ),
      body: BlocConsumer<AdressCubit, AdressState>(listener: (context, state) {
        if (state is editAdresssuccess) {
          pushpushReplacement(context, '/Home_page');
        }
      }, builder: (context, state) {
        final cubit = BlocProvider.of<AdressCubit>(context);

        return HandlingDataView(
            statusReqest1: cubit.statusReqest!,
            widget: Container(
                padding: const EdgeInsets.all(15),
                child: ListView(children: [
                  CustomTextFormAuth(
                      onChanged: (p0) {},
                      hinttext: "city",
                      labeltext: "city",
                      iconData: Icons.location_city,
                      mycontroller: cityedit,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "street",
                      labeltext: "street",
                      iconData: Icons.streetview,
                      mycontroller: streetedit,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomTextFormAuth(
                      hinttext: "name",
                      labeltext: "name",
                      iconData: Icons.near_me,
                      mycontroller: nemeedit,
                      valid: (val) {
                        return null;
                      },
                      isNumber: false),
                  CustomButtomAuth(
                    text: "save",
                    onPressed: () {
                      cubit.adressedit(widget.id, nemeedit.text, cityedit.text,
                          streetedit.text);
                    },
                  )
                ])));
      }),
    );
  }
}
