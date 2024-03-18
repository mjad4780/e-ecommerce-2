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

class Check_Email extends StatelessWidget {
  const Check_Email({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: ColorManager.backgroundcolor,
        elevation: 0.0,
        title: Text('14'.tr(context),
            style: const TextStyle(fontSize: 20)
                .copyWith(color: ColorManager.grey)),
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is CheckEmailFailernodata) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email is not foud"),
              ),
            );
          }
          if (state is CheckEmailSuccess) {
            push(context, '/Check_code_forget');
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ForgetPasswordCubit>(context);
          final cubit1 = BlocProvider.of<AuthCubit>(context);

          return HandlingDataView(
            statusReqest1: cubit.statusReqest!,
            widget: Form(
              key: cubit.formstateforgetpasword,
              autovalidateMode: cubit.autovalidateMode,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "27".tr(context)),
                  const SizedBox(height: 30),
                  CustomTextBodyAuth(
                      // please Enter Your Email Address To Recive A verification code
                      text: "29".tr(context)),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextFormAuth(
                      isNumber: false,

                      hinttext: "12".tr(context),
                      iconData: Icons.email_outlined,
                      labeltext: "18".tr(context),
                      mycontroller: cubit.emailForGet_Password,
                      valid: (String? val) {
                        return cubit1.very(
                            val: val!, max: 50, min: 15, text: '');
                      },
                      // mycontroller: ,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButtomAuth(
                      text: "30".tr(context),
                      onPressed: () {
                        cubit.checkEmail();
                      }),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
