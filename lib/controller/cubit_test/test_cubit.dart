import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:untitled/core/class/Crud.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/core/function/handingdata.dart';
import 'package:untitled/data/datasourse/remote/test_data.dart';
import 'package:untitled/data/model/test.dart';
import 'package:untitled/my%20core/connection/network_info.dart';
import 'package:untitled/my%20core/databases/api/dio_consumer.dart';
import 'package:untitled/my%20core/databases/api/end_ponits.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  TestData testdata = TestData(getIt<Crud>());

  List deta = [];
  StatusReqest? statusReqest;

// var  statusReqest =StatusReqest;
  Data? test;

  getDate() async {
    statusReqest = StatusReqest.laoding;
    var response = await testdata.getData();

    statusReqest = handingdata(response);

    if (StatusReqest.success == statusReqest) {
      if (response['status'] == "success") {
        deta.addAll(response['data']);
        print(deta);
      } else {
        statusReqest = StatusReqest.failure;
      }
      // test = Data.fromJson(response['data']);
      //print(test);
    }
    emit(Testgetdate());
  }
}
