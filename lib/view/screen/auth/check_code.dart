import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/class/haidling_data_view.dart';
import 'package:untitled/core/constans/apptheme.dart';
import 'package:untitled/core/locallization/applocal.dart';
import 'package:untitled/data/datasourse/static/assets.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';

class Check_Code extends StatelessWidget {
  const Check_Code({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Verification Code',
          style: TextStyle(height: 2, color: ColorManager.grey, fontSize: 16),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is verfycodeFailernodata) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Code is not found"),
              ),
            );
          }

          if (state is SuccessVerfycode) {
            push(context, '/Success_page');
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);

          return HandlingDataView(
            statusReqest1: cubit.statusReqest!,
            widget: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 11,
                  ),
                  const Center(
                      child: Text(
                    'CHECK CODE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: ColorManager.black),
                  )),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '29'.tr(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 2, color: ColorManager.grey, fontSize: 16),
                    ),
                  ),
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      // cubit.ver(verificationCode);
                      cubit.VerfiCode(verificationCode);
                    }, // end onSubmit
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
