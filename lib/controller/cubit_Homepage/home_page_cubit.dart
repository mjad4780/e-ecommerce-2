import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/view/screen/home/favorite.dart';
import 'package:untitled/view/screen/home/home.dart';
import 'package:untitled/view/screen/home/profile.dart';
import 'package:untitled/view/screen/home/setting.dart';

import '../../core/class/StatusReqest.dart';
import 'package:flutter/material.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.Api, required this.networkInfo})
      : super(HomePageInitial());

  final ApiConsumer Api;
  StatusReqest? statusReqest = StatusReqest.none;
  final NetworkInfo networkInfo;

  // Test test = Test(Api: getIt<DioConsumer>());
  // List<CategoriesModel> data = [];

  // getDate() async {
  //   try {
  //     var response = await test.repassword();
  //     if (response['status'] == 'success') {
  //       // data.addAll(response);
  //       for (var item in response['data']) {
  //         data.add(CategoriesModel.fromJson(json: item));
  //         emit(SuccessVerfycode());

  //         print(data);
  //       }
  //     } else {}
  //   } on Exception catch (e) {
  //     statusReqest = StatusReqest.serverfailure;
  //     emit(LoginFailer());
  //   }
  // }
  int current = 0;
  List<Widget> botteon = [
    const Home(),
    const Favorite(),
    const Setting(),
    const Profile()
  ];
  currentPage(int index) {
    current = index;
    emit(NavigationBottm());
  }
}
