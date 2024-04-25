import 'package:flutter/material.dart';

import 'package:untitled/core/constans/Color.dart';
import 'package:untitled/my%20core/Navigator/Navigator.dart';
import 'package:untitled/my%20core/databases/cache/cache_helper.dart';
import 'package:untitled/my%20core/get_it/get_it.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 500 / 3,
                  decoration: const BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22)),
                  ),
                ),
                Positioned(
                    top: 50,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[100],
                        child: const Icon(Icons.person,
                            size: 80, color: AppColor.primaryColor),
                      ),
                    )),
              ]),
          const SizedBox(height: 70),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  // onTap: () {},
                  trailing: Switch(
                    onChanged: (val) {},
                    value: true,
                    activeColor: AppColor.primaryColor,
                  ),
                  title: const Text("Disable Notificatios"),
                ),
                ListTile(
                  onTap: () {
                    push(context, '/OrdersPending');

                    // Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: const Icon(Icons.card_travel),
                  title: const Text("Orders"),
                ),
                ListTile(
                  onTap: () {
                    // Get.toNamed(AppRoute.ordersarchive );
                  },
                  trailing: const Icon(Icons.card_travel),
                  title: const Text("Archive"),
                ),
                ListTile(
                  onTap: () {
                    push(context, '/AddressView');
                  },
                  trailing: const Icon(Icons.location_on_outlined),
                  title: const Text("Address"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.help_outline_rounded),
                  title: const Text("About us"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: const Icon(Icons.phone_callback_outlined),
                  title: const Text("Contact us"),
                ),
                ListTile(
                  onTap: () {
                    getIt<CacheHelper>().clearData();
                    pushpushReplacement(context, '/Locallization');
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
