
  // getDateitem() async {
  //   print('object$dataItem');
  //   dataItem.clear();
  //   emit(LoadingHomeitem());
  //   statusReqest = StatusReqest.laoding;
  //   var response = await home.item();
  //   statusReqest = handingdata(response);
  //   response.fold(
  //       (l) => emit(
  //             NodataHomeitem(statusReqest: statusReqest = l),
  //           ), (r) {
  //     dataItem.addAll(r);
  //     dataItem.clear();
  //     emit((Successhomeitem(categories: r)));
  //   });
  // }

////////////
///

  // Future<Either<StatusReqest, List<CategoriesModel>>> home_page_data() async {
  //   try {
  //     var response = await Api.get(EndPoint.home, isFromData: false);
  //     if (response['status'] == 'success') {
  //       for (var item in response['categories']['data']) {
  //         dataCategories.add(CategoriesModel.fromJson(json: item));
  //       } 
  //       return Right(dataCategories);
  //     } else {
  //       return const Left(StatusReqest.offlinefailure);
  //     }
  //   } on Exception catch (e) {
  //     return const Left(StatusReqest.failure);
  //   }

  // }