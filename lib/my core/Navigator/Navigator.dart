import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/screen/Locallization.dart';
import 'package:untitled/view/screen/Onboadind.dart';
import 'package:untitled/view/screen/address/add.dart';
import 'package:untitled/view/screen/address/adddetails.dart';
import 'package:untitled/view/screen/address/view.dart';
import 'package:untitled/view/screen/auth/Login.dart';
import 'package:untitled/view/screen/auth/Signup.dart';
import 'package:untitled/view/screen/auth/check_code.dart';
import 'package:untitled/view/screen/cart/cart.dart';
import 'package:untitled/view/screen/forget_password/check_code.dart';
import 'package:untitled/view/screen/forget_password/CheckEmail.dart';
import 'package:untitled/view/screen/auth/success_page.dart';
import 'package:untitled/view/screen/forget_password/resetpassword.dart';
import 'package:untitled/view/screen/home/Home_page.dart';
import 'package:untitled/view/screen/home/favorite.dart';

import 'package:untitled/view/screen/home/profile.dart';
import 'package:untitled/view/screen/home/setting.dart';

import '../../main.dart';
import '../../view/screen/CheckOreder/checkout.dart';
import '../../view/screen/CheckOreder/pending.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: "/",
      builder: (context, state) =>
          getIt<CacheHelper>().getData(key: 'email') != null
              ? const Home_page()
              : vvv()),

  GoRoute(
    path: "/Login",
    builder: (context, state) => const Login(),
  ),
  GoRoute(
    path: "/Locallization",
    builder: (context, state) => const Language(),
  ),
  GoRoute(
    path: "/Onboading",
    builder: (context, state) => const Onboading(),
  ),
  GoRoute(
    path: "/Sign_up",
    builder: (context, state) => const Sign_up(),
  ),
  GoRoute(
    path: "/Success_page",
    builder: (context, state) => const Success_page(),
  ),
  GoRoute(
    path: "/Check_Code",
    builder: (context, state) => const Check_Code(),
  ),
  GoRoute(
    path: "/Check_Email",
    builder: (context, state) => const Check_Email(),
  ),
  GoRoute(
    path: "/ResetPassword",
    builder: (context, state) => const ResetPassword(),
  ),
  GoRoute(
    path: "/ResetPassword",
    builder: (context, state) => const ResetPassword(),
  ),
  GoRoute(
    path: "/Check_code_forget",
    builder: (context, state) => const Check_code_forget(),
  ),
  GoRoute(
    path: "/Home_page",
    builder: (context, state) => const Home_page(),
  ),
  GoRoute(
    path: "/Favorite",
    builder: (context, state) => const Favorite(),
  ),
  GoRoute(
    path: "/Setting",
    builder: (context, state) => const Setting(),
  ),
  GoRoute(
    path: "/Profile",
    builder: (context, state) => const Profile(),
  ),
  // GoRoute(
  //   path: "/ProductDetails",
  //   builder: (context, state) => const ProductDetails(),
  // ),
  GoRoute(
    path: "/AddressView",
    builder: (context, state) => const AddressView(),
  ),
  GoRoute(
    path: "/AddressAddDetails",
    builder: (context, state) => const AddressAddDetails(),
  ),
  GoRoute(
    path: "/Cart",
    builder: (context, state) => const Cart(),
  ),
  // GoRoute(
  //   path: "/Test",
  //   builder: (context, state) => const Test(),
  // ),
  GoRoute(
    path: "/AddressAddMaps",
    builder: (context, state) => const AddressAddMaps(),
  ),
  GoRoute(
    path: "/checkOrder",
    builder: (context, state) => const CheckOrder(),
  ),
  GoRoute(
    path: "/OrdersPending",
    builder: (context, state) => const OrdersPending(),
  ),
]);

void push(context, String path) {
  GoRouter.of(context).push(
    path,
  );
}

void pushpushReplacement(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

vvv() {
  if (getIt<CacheHelper>().getData(key: 'onbourding') == true) {
    return const Login();
  } else {
    return const Language();
  }
}

void navigaton(context, Widget path) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => path,
    ),
  );
}
