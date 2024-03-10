import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/core/my%20core/Navigator/Navigator.dart';
import 'package:untitled/core/my%20core/resources/color_manager.dart';
import 'package:untitled/view/widget/Auth/custombuttonauth.dart';
import 'package:untitled/view/widget/Auth/customtextbodyauth.dart';
import 'package:untitled/view/widget/Auth/customtextformauth.dart';
import 'package:untitled/view/widget/Auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        // backgroundColor: .backgroundcolor,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: const TextStyle(fontSize: 23)
                .copyWith(color: ColorManager.grey)),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          push(context, '/Login');
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);

          return Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              autovalidateMode: cubit.autovalidateMode,
              key: cubit.formstatenewpassword,
              child: ListView(children: [
                const SizedBox(height: 20),
                CustomTextTitleAuth(text: "35".tr(context)),
                const SizedBox(height: 10),
                CustomTextBodyAuth(text: "35".tr(context)),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return cubit.very(val: val!, max: 50, min: 9, text: '');

                    // return validInput(val!, 3, 40, "password");
                  },
                  mycontroller: cubit.newpassword,
                  hinttext: "13".tr(context),
                  iconData: Icons.lock_outline,
                  labeltext: "19".tr(context),
                  // mycontroller: ,
                ),
                CustomTextFormAuth(
                  isNumber: false,

                  valid: (val) {
                    return cubit.very(val: val!, max: 50, min: 9, text: '');

                    // return validInput(val!, 3, 40, "password");
                  },
                  mycontroller: cubit.repassword,
                  hinttext: "Re ${"13".tr(context)}",
                  iconData: Icons.lock_outline,
                  labeltext: "19".tr(context),
                  // mycontroller: ,
                ),
                CustomButtomAuth(
                    text: "33".tr(context),
                    onPressed: () {
                      if (cubit.formstatenewpassword.currentState!.validate()) {
                        cubit.dispose3();
                        push(context, '/Success_page');
                      } else {
                        cubit.autovalidateMode = AutovalidateMode.always;
                      }
                      // controller.goToSuccessResetPassword();
                    }),
                const SizedBox(height: 40),
              ]),
            ),
          );
        },
      ),
    );
  }
}
