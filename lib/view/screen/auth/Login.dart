import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';
import 'package:untitled/view/screen/auth/success_page.dart';
import 'package:untitled/view/widget/Auth/custombuttonauth.dart';
import 'package:untitled/view/widget/Auth/customtextbodyauth.dart';
import 'package:untitled/view/widget/Auth/customtextformauth.dart';
import 'package:untitled/view/widget/Auth/customtexttitleauth.dart';
import 'package:untitled/view/widget/Auth/logoauth.dart';
import 'package:untitled/view/widget/Auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text('Login', style: TextStyle(fontSize: 33)),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              push(context, '/Home_page');
            }
            if (state is LoginFailernodata) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(" تاكد من كلمه المروراو الايميل"),
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = BlocProvider.of<AuthCubit>(context);
            return HandlingDataView(
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: cubit.formstate,
                  autovalidateMode: cubit.autovalidateMode,
                  child: ListView(children: [
                    const LogoAuth(),
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "10".tr(context)),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "11".tr(context)),
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                      isNumber: false,
                      hinttext: "12".tr(context),
                      iconData: Icons.email_outlined,
                      labeltext: "18".tr(context),
                      mycontroller: cubit.email,
                      valid: (String? val) {
                        return cubit.very(
                            val: val!, max: 50, min: 15, text: '');
                      },
                      // mycontroller: ,
                    ),
                    CustomTextFormAuth(
                      mycontroller: cubit.Password,
                      valid: (val2) {
                        return cubit.very(
                            val: val2!, max: 50, min: 9, text: '');
                      },
                      isNumber: false,
                      hinttext: "13".tr(context),
                      iconData: cubit.obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.remove_red_eye,
                      labeltext: "19".tr(context),
                      obscureText: true,
                      onTapIcon: () {
                        cubit.hello();
                      },
                    ),
                    InkWell(
                      onTap: () {
                        router.go('/forget_password');
                        // push(context, '/forget_password');
                      },
                      child: Text(
                        "14".tr(context),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    CustomButtomAuth(
                        text: "15".tr(context),
                        onPressed: () {
                          cubit.gggg();
                        }),
                    const SizedBox(height: 40),
                    CustomTextSignUpOrSignIn(
                      textone: "16".tr(context),
                      texttwo: "17".tr(context),
                      onTap: () {
                        router.go('/Sign_up');

                        //  push(context, '/Sign_up');
                      },
                    )
                  ]),
                ),
              ),
              statusReqest1: cubit.statusReqest!,
            );
          },
        ));
  }
}
