import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import 'package:untitled/core/class/StatusReqest.dart';
import 'package:untitled/data/datasourse/static/assets.dart';

class HandlingDataView extends StatelessWidget {
  final Widget widget;
  final StatusReqest statusReqest1;
  const HandlingDataView(
      {super.key, required this.widget, required this.statusReqest1});

  @override
  Widget build(BuildContext context) {
    // final cubit = BlocProvider.of<AuthCubit>(context);

    return statusReqest1 == StatusReqest.laoding
        ? Center(child: Lottie.asset(Assets.loading, width: 250, height: 250))
        : statusReqest1 == StatusReqest.offlinefailure
            ? Center(
                child: Lottie.asset(Assets.offline, width: 250, height: 250))
            : statusReqest1 == StatusReqest.serverfailure
                ? Center(
                    child: Lottie.asset(Assets.server, width: 250, height: 250))
                : statusReqest1 == StatusReqest.failure
                    ? Center(
                        child: Lottie.asset(Assets.nodata,
                            width: 250, height: 250))
                    : widget;
  }
}
