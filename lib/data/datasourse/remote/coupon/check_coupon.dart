import 'package:dartz/dartz.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/data/model/couponModel.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class Coupon {
  final ApiConsumer api;

  List<CouponModel> ggg = [];
  CouponModel? couponModel;
  Coupon({required this.api});
  Future<Either<StatusReqest, CouponModel>> checkcoupon(String coupon) async {
    try {
      var response = await api.post(EndPoint.checkCoupon,
          isFromData: true, data: {"coupon": coupon});
      if (response['status'] == 'success') {
        Map<String, dynamic> listdata = response['data'];
        couponModel = CouponModel.fromJson(listdata);

        // for (var item in response['data']) {

        //   ggg.add(CouponModel.fromJson(item));
        // }
        return Right(couponModel!);
      } else {
        return const Left(StatusReqest.none);
      }
    } on Exception {
      return const Left(StatusReqest.serverfailure);
    }
  }
}
