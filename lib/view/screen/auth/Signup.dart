import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/view/widget/Auth/custombuttonauth.dart';
import 'package:untitled/view/widget/Auth/customtextbodyauth.dart';
import 'package:untitled/view/widget/Auth/customtextformauth.dart';
import 'package:untitled/view/widget/Auth/customtexttitleauth.dart';
import 'package:untitled/view/widget/Auth/textsignup.dart';

class Sign_up extends StatelessWidget {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Sign_up', style: TextStyle(fontSize: 33)),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            push(context, '/Check_Code');
          }
          if (state is SignUpFailernodata) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email is found"),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);

          return HandlingDataView(
            statusReqest1: cubit.statusReqest!,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: cubit.formstateSign_up,
                autovalidateMode: cubit.autovalidateMode,
                child: ListView(children: [
                  const SizedBox(
                    height: 22,
                  ),
                  CustomTextTitleAuth(text: "10".tr(context)),
                  const SizedBox(height: 30),
                  CustomTextBodyAuth(text: "11".tr(context)),
                  const SizedBox(height: 30),
                  CustomTextFormAuth(
                    isNumber: false,
                    hinttext: "23".tr(context),
                    iconData: Icons.person_outline,
                    labeltext: "20".tr(context),
                    mycontroller: cubit.username,
                    valid: (String? val) {
                      return cubit.very(val: val!, max: 50, min: 5, text: '');
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormAuth(
                    mycontroller: cubit.emailSignUp,
                    valid: (String? val) {
                      return cubit.very(val: val!, max: 50, min: 12, text: '');
                    },
                    isNumber: false,
                    hinttext: "12".tr(context),
                    iconData: Icons.email_outlined,
                    labeltext: "18".tr(context),
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormAuth(
                    isNumber: true,
                    hinttext: "22".tr(context),
                    iconData: Icons.phone_android_outlined,
                    labeltext: "21".tr(context),
                    mycontroller: cubit.phone,
                    valid: (String? val) {
                      return cubit.very(val: val!, max: 10, min: 7, text: '');
                    },
                    // mycontroller: ,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormAuth(
                    isNumber: false,
                    hinttext: "13".tr(context),
                    iconData: Icons.lock_outline,
                    labeltext: "19".tr(context),
                    mycontroller: cubit.passwordSign_up,
                    valid: (String? val) {
                      return cubit.very(val: val!, max: 50, min: 9, text: '');
                    },
                    // mycontroller: ,
                  ),
                  const SizedBox(height: 16),
                  CustomButtomAuth(
                      text: "17".tr(context),
                      onPressed: () {
                        cubit.sign_up();
                      }),
                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: "25".tr(context),
                    texttwo: "9".tr(context),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
