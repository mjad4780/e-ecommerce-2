import 'package:bloc/bloc.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/home/categories.dart';
import 'package:untitled/data/datasourse/remote/home/item_categories.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';
import 'package:untitled/view/screen/home/favorite.dart';
import 'package:untitled/view/screen/home/home.dart';
import 'package:untitled/view/screen/home/profile.dart';
import 'package:untitled/view/screen/home/setting.dart';

import '../../core/class/StatusReqest.dart';
import 'package:flutter/material.dart';

import '../../data/model/categoriesmodel.dart';
import '../../my core/databases/api/dio_consumer.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.Api, required this.networkInfo})
      : super(HomePageInitial());

  final ApiConsumer Api;
  StatusReqest? statusReqest = StatusReqest.none;
  final NetworkInfo networkInfo;

  HomeData home = HomeData(Api: getIt<DioConsumer>());
  List<CategoriesModel> dataCategories = [];
  List<ItemsModel> dataItem = [];

  getDate() async {
    try {
      emit(LoadingHome());
      statusReqest = StatusReqest.laoding;

      var response = await home.home_page_data();
      statusReqest = handingdata(response);
      if (response['status'] == 'success') {
        for (var item in response['categories']) {
          dataCategories.add(CategoriesModel.fromJson(json: item));
          emit((Successhome()));
        }
        for (var item in response['itemview']) {
          dataItem.add(ItemsModel.fromJson(item));
          emit((Successhome()));
        }
      } else {
        emit((NodataHome()));

        statusReqest = StatusReqest.offlinefailure;
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit((FailerHome()));
    }
  }

  CategoriesItem categoriesItem = CategoriesItem(Api: getIt<DioConsumer>());
  List<ItemsModel> categoriesItemData = [];
  int i = 0;

  CategoriesItemGetDate(
    int id,
  ) async {
    try {
      categoriesItemData.clear();
      emit(LoadingitemCategories());
      statusReqest = StatusReqest.laoding;
      var response = await categoriesItem.categoriesItem_data(id);
      statusReqest = handingdata(response);

      if (response['status'] == 'success') {
        for (var item in response['data']) {
          // dataCategories.add(CategoriesModel.fromJson(json: item));
          categoriesItemData.add(ItemsModel.fromJson(item));
          // print(dataCategories);

          emit((SuccessitemCategories()));
        }
      } else {
        emit((NodataitemCategories()));

        statusReqest = StatusReqest.failure;
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit((FaileritemCategories()));
    }
  }

  very_i(int val) {
    i = val;
  }

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
