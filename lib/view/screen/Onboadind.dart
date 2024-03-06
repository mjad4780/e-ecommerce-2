import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/data/model/onbording.dart';

class Onboading extends StatelessWidget {
  const Onboading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: onboidin.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Image(
                            image: AssetImage(onboidin[index].path),
                          ),
                        ),
                        //     const AssetImage('assets/images/illustration.png')
                        //  const AssetImage('assets/images/illustration.png'),
                        Text(onboidin[index].title),
                        Text(onboidin[index].des)
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color.fromARGB(179, 198, 194, 194),
                  boxShadow: [BoxShadow(offset: Offset.infinite)]),
              width: double.infinity,
              height: 40,
              child: Row(),
            )
          ],
        ),
      ),
    );
  }
}
