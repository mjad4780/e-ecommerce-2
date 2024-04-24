import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/showSnacpar.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';

import '../../core/function/handingdata.dart';
import '../../data/datasourse/remote/order/checkout.dart';
import '../../my core/connection/network_info.dart';
import '../../my core/databases/api/dio_consumer.dart';
import '../../my core/databases/cache/cache_helper.dart';
import '../../my core/get_it/get_it.dart';
import '../cubit_cart/cart_cubit.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  CartCubit cartCubit = CartCubit(networkInfo: getIt<NetworkInfoImpl>());
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

  checkout(BuildContext context, int orderprice, int coupon) async {
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
      "paymentmethod": paymentMethod
    };

    try {
      var response = await orderdata.checkout(data);
      print("=============================== Controller $response ");
      statusReqest = handingdata(response);
      if (response['status'] == "success") {
        pushpushReplacement(context, '/Home_page');
        emit(SuccessCheckout());
        // Get.offAllNamed(AppRoute.homepage);
        // Get.snackbar("Success", "the order was successfully");
      } else {
        emit(FDailerCheckout());

        // statusRequest = StatusRequest.none;
        // Get.snackbar("Error", "try again");
      }
    } on Exception catch (e) {
      emit(Failer());
    }
    // End

//     update();
  }
}
