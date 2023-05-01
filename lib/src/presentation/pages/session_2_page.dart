import 'package:flutter/material.dart';

import '../features/local_and_network/local_fetch.dart';
import '../features/local_and_network/network_fetch.dart';

List<String> titles = ["โปเกมอน Go", "ตัวโปรด"];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titles.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("ข้อมูลจาก API และ ข้อมูลจาก Local store"),
          // This check specifies which nested Scrollable's scroll notification
          // should be listened to.
          //
          // When `ThemeData.useMaterial3` is true and scroll view has
          // scrolled underneath the app bar, this updates the app bar
          // background color and elevation.
          //
          // This sets `notification.depth == 1` to listen to the scroll
          // notification from the nested `ListView.builder`.
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.vpn_lock),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.storage_sharp),
                text: titles[1],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NetworkByHttp(title: "ข้อมูลจาก Internet ด้วย Http"),
            LocalStoreByHive(title: "เรียกข้อมูลภายใน ด้วย Hive"),
          ],
        ),
      ),
    );
  }
}
