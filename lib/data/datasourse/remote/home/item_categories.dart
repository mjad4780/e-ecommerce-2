import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';

class CategoriesItem {
  final ApiConsumer Api;
  // StatusReqest? statusReqest;
  // final NetworkInfo networkInfo;

  CategoriesItem({required this.Api});

  categoriesItem_data(int id) async {
    // if (await networkInfo.isConnected!) {
    var response =
        await Api.post(EndPoint.categories, data: {'id': id}, isFromData: true);

    return response;
    // } else {
    //   statusReqest = StatusReqest.offlinefailure;
    // }
  }
}
