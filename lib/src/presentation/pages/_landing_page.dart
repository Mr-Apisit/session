import 'package:flutter/material.dart';
import 'package:session/src/presentation/widgets/chip.dart';

import '../features/state_ful.dart';
import '../features/state_less.dart';
import '../features/widgets/app_bar.dart';
import '../features/widgets/bottom_nav_bar.dart';
import '../features/widgets/image.dart';
import '../features/widgets/tab_bar.dart';
import '../widgets/text_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> widgetsGroup = [
      {"topic": "Appbar", "navigator": const AppbarWidget(title: "My app bar")},
      {"topic": "Tabbar", "navigator": const TabBarWidget(title: "My tab bar")},
      {"topic": "BottomNavigationBar", "navigator": const BottomNavBarWidget(title:"My buttom navigation bar")},
      {"topic": "Image", "navigator": const ImageWidget(title: "My image")},
      // {"topic": "Row", "navigator": const WidgetsPage(3)},
      // {"topic": "Column", "navigator": const WidgetsPage(4)},
      // {"topic": "Text", "navigator": const WidgetsPage(5)},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: 1000,
            width: double.maxFinite - 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0)),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Text(
                    "FLutter Beginner",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextButton(
                        text: "State ful widget",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const StateFul(
                                title: "State full widget",
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text("หรือ", style: Theme.of(context).textTheme.titleLarge),
                      ),
                      MyTextButton(
                        text: "State less widget",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const StateLess(
                                title: "State less widget",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("Widgets พื้นฐาน", style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                    child: Container(
                      height: 250,
                      width: double.maxFinite,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Colors.grey.shade100),
                      child: Wrap(
                        spacing: 6.0,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < widgetsGroup.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyChip((i + 1).toString(), widgetsGroup[i]["topic"],
                                  onPressed: () => Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => widgetsGroup[i]["navigator"]))),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("Layouts พื้นฐาน", style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                    child: Container(
                      height: 250,
                      width: double.maxFinite,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Colors.grey.shade100),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
