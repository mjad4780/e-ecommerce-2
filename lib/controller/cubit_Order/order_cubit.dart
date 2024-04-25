// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/showSnacpar.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';

import '../../core/function/handingdata.dart';
import '../../data/datasourse/remote/order/checkout.dart';
import '../../data/model/ordersmodel.dart';
import '../../my core/databases/api/dio_consumer.dart';
import '../../my core/databases/cache/cache_helper.dart';
import '../../my core/get_it/get_it.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  TextEditingController coupon = TextEditingController();
  StatusReqest? statusReqest = StatusReqest.none;
  Orderdata orderdata = Orderdata(Api: getIt<DioConsumer>());
  int? paymentMethod;
  int? deliveryType;
  int addressid = 0;

  choosePaymentMethod(int val) {
    paymentMethod = val;
    emit(ChoosePaymentMethod());
  }

  chooseDeliveryType(int val) {
    deliveryType = val;
    emit(ChooseDeliveryType());
  }

  chooseShippingAddress(int val) {
    addressid = val;
    emit(ChooseShippingAddress());
  }

  checkout(
      BuildContext context, int orderprice, int coupon, int discoount) async {
    if (paymentMethod == null) {
      return showMyDialog(context, 'Please select a payment method');
    }
    if (deliveryType == null) {
      return showMyDialog(context, 'Please select a order Type');
    }
    emit(LoadingCheckout());
    statusReqest = StatusReqest.laoding;
    Map<String, dynamic> data = {
      "userid": getIt<CacheHelper>().getData(key: 'id'),
      "adressid": addressid,
      "ordertype": deliveryType,
      "pricedelivery": 10,
      "orderprice": orderprice,
      "couponid": coupon,
      "paymentmethod": paymentMethod,
      "coupondiscount": discoount
    };

    try {
      var response = await orderdata.checkout(data);
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        pushpushReplacement(context, '/Home_page');
        emit(SuccessCheckout());
      } else {
        emit(FDailerCheckout());
      }
    } on Exception {
      emit(Failer());
    }
  }

  List<OrdersModel> data = [];

  String printOrderType(int val) {
    if (val == 0) {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    emit(Loadinggetorder());
    statusReqest = StatusReqest.laoding;
    try {
      var response = await orderdata.Getorder();
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
        emit(Successgetorder());
      } else {
        statusReqest = StatusReqest.failure;
        emit(FDailergetorder());
      }
    } on Exception {
      statusReqest = StatusReqest.serverfailure;
      emit(Failergetorder());
    }
  }
}
