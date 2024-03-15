import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/controller/cubit_auth/auth_cubit.dart';
import 'package:untitled/controller/cubit_test/test_cubit.dart';
import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/data/datasourse/static/assets.dart';

class HandlingDataView extends StatelessWidget {
  final Widget widget;
  final StatusReqest statusReqest1;
  const HandlingDataView(
      {super.key, required this.widget, required this.statusReqest1});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    // BlocConsumer<AuthCubit, AuthState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    return cubit.statusReqest == StatusReqest.laoding
        ? Center(child: Lottie.asset(Assets.loading, width: 250, height: 250))
        : cubit.statusReqest == StatusReqest.offlinefailure
            ? Center(
                child: Lottie.asset(Assets.offline, width: 250, height: 250))
            : cubit.statusReqest == StatusReqest.serverfailure
                ? Center(
                    child: Lottie.asset(Assets.server, width: 250, height: 250))
                : cubit.statusReqest == StatusReqest.failure
                    ? Center(
                        child: Lottie.asset(Assets.noData,
                            width: 250, height: 250))
                    : widget;
    //   },
    // );
  }
}
