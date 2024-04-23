// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/cart/cart.dart';
import 'package:untitled/data/datasourse/remote/coupon/check_coupon.dart';
import 'package:untitled/data/model/cartmodel.dart';
import 'package:untitled/data/model/couponModel.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.networkInfo}) : super(CartInitial());
  TextEditingController coupon = TextEditingController();
  StatusReqest? statusReqest = StatusReqest.none;
  final NetworkInfo networkInfo;
  CartData cartData = CartData(Api: getIt<DioConsumer>());
  Coupon coupons = Coupon(api: getIt<DioConsumer>());

  deleteCart(int id) async {
    try {
      emit(loadingdeleteCart());
      statusReqest = StatusReqest.laoding;
      var response = await cartData.deletecart(id);
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        emit(SuccessdeleteCart());
      }
    } on Exception {
      statusReqest = StatusReqest.serverfailure;

      emit(FailerdeleteCart());
    }
  }

  Delete(int id) {
    if (countitems > 0) {
      deleteCart(id);
      countitems--;
    } else {
      countitems = 0;
    }
  }

  addcart(int id) async {
    try {
      emit(loadingAddCart());
      statusReqest = StatusReqest.laoding;
      var response = await cartData.addcart(id);
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        emit(SuccessAddCart());
      }
    } on Exception {
      statusReqest = StatusReqest.serverfailure;
      emit(FailerAddCart());
    }
  }

  Add(int id) {
    addcart(id);
    countitems++;
  }

  int countitems = 0;

  currentcart(int id) async {
    try {
      emit(loadingGetcurrentCart());
      statusReqest = StatusReqest.laoding;
      var response = await cartData.getcurrentcart(id);
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        countitems = response['data'];
        emit(SuccessGetcurrentCart());
      }
    } on Exception {
      statusReqest = StatusReqest.serverfailure;
      emit(FailerGetcurrentCart());
    }
  }

  List<CartModel> mycart = [];

  int Totalprice = 0;
  // int itemprice_discount = 0;

  String itemcount = '';
  GETCart() async {
    try {
      mycart.clear();
      emit(loadingGetCart());
      statusReqest = StatusReqest.laoding;
      var response = await cartData.getcart();
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        if (response['datacart']['status'] != 'failure') {
          Totalprice = response['countprice']['totalprice'];
          // itemprice_discount = response['countprice']['itemprice_discount'];

          itemcount = response['countprice']['totalcount'];
          for (var item in response['datacart']['data']) {
            mycart.add(CartModel.fromJson(item));
          }

          emit(SuccessGetCart());
        } else {
          statusReqest = StatusReqest.failure;

          emit(NodataGetCart());
        }
      }
    } on Exception {
      statusReqest = StatusReqest.serverfailure;

      emit(FailerGetCart());
    }
  }

  // List<CouponModel> coubonData = [];
  int discount = 0;
  int id = 0;
  String name = '';

  CeckCoupon() async {
    emit(LoadingCoupon());
    statusReqest = StatusReqest.laoding;
    var response = await coupons.checkcoupon(coupon.text);
    statusReqest = handingdata(response);
    response.fold((l) {
      if (l == StatusReqest.none) {
        emit(NodataCoupon());
        coupon.clear();
        name = '';
        id = 0;
        discount = 0;
      }
      emit(
        FailerCoupon(statusReqest: statusReqest = l),
      );
    }, (r) {
      discount = r.couponDiscount!;
      emit((SuccessCoupon()));
    });
  }

  getTotalPrice() {
    return (Totalprice - Totalprice * discount / 100);
  }
}
