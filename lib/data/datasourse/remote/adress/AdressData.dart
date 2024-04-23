import 'package:dartz/dartz.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/data/model/addressmodel.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

class Adress {
  final ApiConsumer api;

  List<AddressModel> ggg = [];
  Adress({required this.api});
  Future<Either<StatusReqest, List<AddressModel>>> getAdress() async {
    try {
      var response = await api.post(EndPoint.adress_get,
          isFromData: true,
          data: {"userid": getIt<CacheHelper>().getData(key: 'id')});
      if (response['status'] == 'success') {
        for (var item in response['data']) {
          ggg.add(AddressModel.fromJson(item));
        }
        // List listdata = response['data'];;
        // ggg.addAll(listdata.map((e) => AddressModel.fromJson(e)));

        return Right(ggg);
      } else {
        return const Left(StatusReqest.failure);
      }
    } on Exception {
      return const Left(StatusReqest.serverfailure);
    }
  }

  Future<Either<StatusReqest, dynamic>> addAdress(
    String name,
    String city,
    String street,
    String lat,
    String long,
  ) async {
    try {
      var response =
          await api.post(EndPoint.adress_add, isFromData: true, data: {
        "userid": getIt<CacheHelper>().getData(key: 'id'),
        "name": name,
        "city": city,
        "street": street,
        "long": long,
        "lat": lat,
      });
      if (response['status'] == 'success') {
        return Right(response);
      } else {
        return const Left(StatusReqest.failure);
      }
    } on Exception {
      return const Left(StatusReqest.serverfailure);
    }
  }

  Future<Either<StatusReqest, dynamic>> editAdress(String name, String city,
      String street, double lat, double long, int id) async {
    try {
      var response =
          await api.post(EndPoint.adress_edit, isFromData: true, data: {
        "userid": getIt<CacheHelper>().getData(key: 'id'),
        "name": name,
        "city": city,
        "street": street,
        "long": long,
        "lat": lat,
        "id": id,
      });
      if (response['status'] == 'success') {
        return Right(response);
      } else {
        return const Left(StatusReqest.failure);
      }
    } on Exception {
      return const Left(StatusReqest.serverfailure);
    }
  }

  Future<Either<StatusReqest, dynamic>> deleteAdress(int id) async {
    try {
      var response = await api
          .post(EndPoint.adress_delete, isFromData: true, data: {"id": id});
      if (response['status'] == 'success') {
        return Right(response);
      } else {
        return const Left(StatusReqest.failure);
      }
    } on Exception {
      return const Left(StatusReqest.serverfailure);
    }
  }
}
