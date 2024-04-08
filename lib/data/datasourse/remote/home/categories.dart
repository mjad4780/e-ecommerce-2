import 'package:dartz/dartz.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/model/categoriesmodel.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class HomeData {
  final ApiConsumer Api;

  StatusReqest? statusReqest = StatusReqest.none;

  HomeData({required this.Api});
  List<CategoriesModel> dataCategories = [];

  home_page_data() async {
    // if (await networkInfo.isConnected!) {
    var response = await Api.get(EndPoint.home, isFromData: false);

    return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }
//////////////////////////////////////

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
