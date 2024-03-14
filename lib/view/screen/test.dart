import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/controller/cubit_test/test_cubit.dart';
import 'package:untitled/core/class/StatusReqest.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: BlocProvider(
        create: (context) => TestCubit()..getDate(),
        child: BlocConsumer<TestCubit, TestState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = BlocProvider.of<TestCubit>(context);
              if (cubit.statusReqest == StatusReqest.laoding) {
                return const Center(child: Text("laoding..........."));
              } else if (cubit.statusReqest == StatusReqest.offlinefailure) {
                return const Center(child: Text("offfline.................."));
              } else if (cubit.statusReqest == StatusReqest.serverfailure) {
                return const Center(child: Text("serverfailure..........."));
              } else {
                return Center(child: Text('data${cubit.deta}'));
                // return ListView.builder(
                //     itemCount: cubit.dataa.length,
                //     itemBuilder: (context, i) {
                //       return cubit.deta.isEmpty
                //           ? const Center(child: CircularProgressIndicator())
                //           : Column(
                //               children: [
                //                 Text('${cubit.dataa}'),
                //                 const Center(child: Text('cubit.deta}')),
                //               ],
                //             );
                //     });
              }
            }),
      ),
    );
  }
}
