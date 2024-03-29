import 'package:flutter/material.dart';
import 'package:untitled/core/locallization/applocal.dart';

import 'package:untitled/data/datasourse/static/assets.dart';
import 'package:untitled/main.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';
import 'package:untitled/view/screen/auth/Login.dart';
import 'package:untitled/view/widget/Auth/custombuttonauth.dart';

class Success_page extends StatelessWidget {
  const Success_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: ColorManager.primaryColor,
            )),
            SizedBox(
                height: 110,
                child: CustomButtomAuth(
                  width: double.infinity,
                  haigh: 55,
                  text: 'Okay',
                  onPressed: () {
                    router.go('/Login');

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => const Login()),
                    // );

                    // push(context, '/Login');
                  },
                ))
          ],
        ),
      ),
    );
  }
}
