import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/sqlliite.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/favorite/favorite.dart';
import 'package:untitled/data/datasourse/remote/home/categories.dart';
import 'package:untitled/data/datasourse/remote/home/item_categories.dart';
import 'package:untitled/data/model/Item.dart';
import 'package:untitled/data/model/favorite.dart';
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
        for (var item in response['item1view']) {
          dataItem.add(ItemsModel.fromJson(item));
          emit((Successhome()));
        }
        await GetFavorite();
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
          categoriesItemData.add(ItemsModel.fromJson(item));

          emit((SuccessitemCategories()));
        }
      } else {
        emit((NodataitemCategories()));

        statusReqest = StatusReqest.failure;
      }
      await GetFavorite();
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;
      emit((FaileritemCategories()));
    }
  }

  FavoriteData favorite = FavoriteData(Api: getIt<DioConsumer>());

  AddFavorite(int id) async {
    try {
      var response = await favorite.addfavorite(id);
      emit(SuccessAdd());
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;

      emit(failerAdd());
    }
  }

  RemoveFavorite(int id) async {
    try {
      var response = await favorite.removefavorite(id);
      await GetFavorite();
      emit(SuccessRemove());
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;

      emit(failerRemove());
    }
  }

  List<MyFavoriteModel> myfavorite = [];
  Set<int> itemid = {};
  GetFavorite() async {
    try {
      myfavorite.clear();
      emit(Loadingfavoriteget());
      statusReqest = StatusReqest.laoding;
      var response = await favorite.getfavorite();
      statusReqest = handingdata(response);

      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        for (var item in response['data']) {
          itemid.add(item['favorite_itemsid']);
          myfavorite.add(MyFavoriteModel.fromJson(item));
          emit(successFavoriteget());
        }
        print(itemid);
      } else {
        statusReqest = StatusReqest.failure;

        emit(NodataFavoriteget());
      }
    } on Exception catch (e) {
      statusReqest = StatusReqest.serverfailure;

      emit(failerRemove());
    }
  }

  // List ggg = [];
  // Set<String> ee = {};

  // SqlDb sql1 = SqlDb();
  // insert(String Itemid) async {
  //   emit(loadinglocallInitial());
  //   var response = await sql1.insert('favorite', {'itemid': Itemid});
  //   await readData();
  //   emit(SaveLocalInitial());
  // }

  // Future readData() async {
  //   List<Map> response = await sql1.read("favorite");
  //   for (var i in response) {
  //     ee.add(i['itemid']);
  //   }
  //   emit(ReadLocalInitial());
  // }

  // remove(String i) async {
  //   emit(loadinglocallInitial());
  //   var response = await sql1.Delete('favorite', 'itemid= $i');
  //   if (response > 0) {
  //     ee.removeWhere((element) => element == i);
  //   }
  //   emit(removelInitial());
  // }

  // api() {
  //   for (var i in ee) {
  //     AddFavorite(int.parse(i));
  //     print(i);
  //     print(ee);
  //   }
  // }

  // Map Maplike = {};
  // Like(id, val) {
  //   Maplike[id] = val;
  // }
  ////////////////////
  int i = 0;

  very_i(int val) {
    i = val;
  }

//////////////////////////////////
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

  ////////////////////////////////
}
