import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/controller/cubit_forget/forget_password_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';
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
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is RepasswordFailernodata) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email is not foud"),
              ),
            );
          }
          if (state is RepasswordSuccess) {
            pushpushReplacement(context, '/Login');
          }
          if (state is RepasswordNull) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("password does not match"),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ForgetPasswordCubit>(context);
          final cubit1 = BlocProvider.of<AuthCubit>(context);

          return HandlingDataView(
              statusReqest1: cubit.statusReqest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                        return cubit1.very(
                            val: val!, max: 50, min: 9, text: '');

                        // return validInput(val!, 3, 40, "password");
                      },
                      mycontroller: cubit.repassword,
                      hinttext: "13".tr(context),
                      iconData: Icons.lock_outline,
                      labeltext: "19".tr(context),
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      isNumber: false,

                      valid: (val) {
                        return cubit1.very(
                            val: val!, max: 50, min: 9, text: '');

                        // return validInput(val!, 3, 40, "password");
                      },
                      mycontroller: cubit.repassword2,
                      hinttext: "Re ${"13".tr(context)}",
                      iconData: Icons.lock_outline,
                      labeltext: "19".tr(context),
                      // mycontroller: ,
                    ),
                    CustomButtomAuth(
                        text: "33".tr(context),
                        onPressed: () {
                          cubit.Repasswor();
                          // controller.goToSuccessResetPassword();
                        }),
                    const SizedBox(height: 40),
                  ]),
                ),
              ));
        },
      ),
    );
  }
}
