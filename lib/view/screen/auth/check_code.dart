import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:untitled/core/constans/apptheme.dart';
import 'package:untitled/core/locallization/applocal.dart';
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
      body: SafeArea(
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
                push(context, '/Success_page');
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
