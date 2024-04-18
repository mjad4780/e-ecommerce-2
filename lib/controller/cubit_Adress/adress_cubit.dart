import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/adress/AdressData.dart';
import 'package:untitled/my%20core/databases/api/api_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';

import '../../core/class/StatusReqest.dart';
import '../../data/model/addressmodel.dart';
import '../../my core/databases/api/dio_consumer.dart';
import '../../my core/get_it/get_it.dart';

part 'adress_state.dart';

class AdressCubit extends Cubit<AdressState> {
  AdressCubit(this.api) : super(AdressInitial());
  final ApiConsumer api;
  TextEditingController nemeadd = TextEditingController();
  TextEditingController cityadd = TextEditingController();
  TextEditingController streetadd = TextEditingController();

  StatusReqest? statusReqest = StatusReqest.none;
  Adress adress = Adress(api: getIt<DioConsumer>());
  List<AddressModel> getadrees = [];
  double lat = 0876858;
  double long = 0557547;

  adressget() async {
    getadrees.clear();
    emit(Adressloding());
    statusReqest = StatusReqest.laoding;
    var response = await adress.getAdress();
    statusReqest = handingdata(response);
    response.fold(
        (l) => emit(
              Adressfailer(statusReqest: statusReqest = l),
            ), (r) {
      getadrees.addAll(r);
      emit((Adresssuccess()));
    });
  }

  adressaddd() async {
    emit(addAdressloding());
    statusReqest = StatusReqest.laoding;
    var response = await adress.addAdress(
        nemeadd.text, cityadd.text, streetadd.text, lat, long);
    statusReqest = handingdata(response);
    response.fold(
        (l) => emit(
              addAdressfailer(statusReqest: statusReqest = l),
            ), (r) {
      emit((addAdresssuccess()));
    });
  }

  adressedit(
    int id,
    String nameedit,
    String cityedit,
    String streetedit,
  ) async {
    emit(editAdressloding());
    statusReqest = StatusReqest.laoding;
    var response =
        await adress.editAdress(nameedit, cityedit, streetedit, lat, long, id);
    statusReqest = handingdata(response);
    response.fold(
        (l) => emit(
              editAdressfailer(statusReqest: statusReqest = l),
            ), (r) {
      emit((editAdresssuccess()));
    });
  }

  adressdelete(int id) async {
    emit(deleteAdressloding());
    statusReqest = StatusReqest.laoding;
    var response = await adress.deleteAdress(id);
    getadrees.removeWhere((element) => element.addressId == id);

    statusReqest = handingdata(response);
    response.fold(
        (l) => emit(
              deleteAdressfailer(statusReqest: statusReqest = l),
            ), (r) {
      emit((deleteAdresssuccess()));
    });
  }
}
