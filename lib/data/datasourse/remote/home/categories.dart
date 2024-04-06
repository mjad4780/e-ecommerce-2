import 'package:dartz/dartz.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/model/categoriesmodel.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class HomeData {
  final ApiConsumer Api;
  // StatusReqest? statusReqest;
  // final NetworkInfo networkInfo;
  StatusReqest? statusReqest = StatusReqest.none;

  HomeData({required this.Api});
  List<CategoriesModel> dataCategories = [];

  Future<Either<StatusReqest, List<CategoriesModel>>> home_page_data() async {
    // if (await networkInfo.isConnected!) {
    try {
      var response = await Api.get(EndPoint.home, isFromData: false);
      if (response['status'] == 'success') {
        for (var item in response['categories']['data']) {
          dataCategories.add(CategoriesModel.fromJson(json: item));
        }
        print('############################################');
        return Right(dataCategories);
      } else {
        print('########gtfh####################################');
        statusReqest = StatusReqest.offlinefailure;

        return const Left(StatusReqest.offlinefailure);
      }

      // print('############################################');
    } on Exception catch (e) {
      print('############################################${e.toString()}');
      return const Left(StatusReqest.failure);
    }
    // return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }

  searchdata(String search) async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.post(EndPoint.search,
        data: {'search': search}, isFromData: true);

    return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }
}
