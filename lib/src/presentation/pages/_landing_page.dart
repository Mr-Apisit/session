import 'package:flutter/material.dart';
import 'package:session/src/presentation/features/widgets/center.dart';
import 'package:session/src/presentation/features/widgets/column.dart';
import 'package:session/src/presentation/features/widgets/row.dart';
import 'package:session/src/presentation/features/widgets/text.dart';
import 'package:session/src/presentation/widgets/chip.dart';

import '../features/state_ful.dart';
import '../features/state_less.dart';
import '../features/widgets/app_bar.dart';
import '../features/widgets/bottom_nav_bar.dart';
import '../features/widgets/container.dart';
import '../features/widgets/data_table.dart';
import '../features/widgets/icon.dart';

import '../features/widgets/image_local.dart';
import '../features/widgets/image_network.dart';
import '../features/widgets/listview.dart';
import '../features/widgets/loading_circular.dart';
import '../features/widgets/loading_linear.dart';
import '../features/widgets/sized_box.dart';
import '../features/widgets/tab_bar.dart';
import '../features/widgets/text_input.dart';
import '../widgets/text_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> widgetsGroup = [
      {"topic": "Text", "navigator": const TextWidget(title: "My Text")},
      {"topic": "Icon", "navigator": const IconWidget(title: "My Icon")},
      {"topic": "Appbar", "navigator": const AppbarWidget(title: "My Bar")},
      {"topic": "Tabbar", "navigator": const TabBarWidget(title: "My Tab")},
      {"topic": "BottomNavigationBar", "navigator": const BottomNavBarWidget(title: "My Navigation")},
      {"topic": "LocalImage", "navigator": const LocalImageWidget(title: "My Local Image")},
      {"topic": "NetworkImage", "navigator": const NetworkImageWidget(title: "My Network image")},
      {"topic": "CircularLoading", "navigator": const CircularLoadingWidget(title: "My Circular Loading")},
      {"topic": "LinearLoading", "navigator": const LinearLoadingWidget(title: "My Linear Loading")},

      // {"topic": "Text", "navigator": const WidgetsPage(5)},
    ];
    List<Map<String, dynamic>> layoutGroup = [
      {"topic": "Center", "navigator": const CenterWidget(title: "My Center")},
      {"topic": "SizedBox", "navigator": const SizedBoxWidget(title: "My SizedBox")},
      {"topic": "Container", "navigator": const ContainerWidget(title: "My Container")},
      {"topic": "Row", "navigator": const RowWidget(title: "My Row")},
      {"topic": "Column", "navigator": const ColumnWidget(title: "My Column")},
      {"topic": "ListView", "navigator": const ListViewWidget(title: "My List")},
    ];

    List<Map<String, dynamic>> inputGroup = [
      {"topic": "Text Input", "navigator": const TextInputWidget(title: "My text input")},
      {"topic": "DataTable", "navigator": const DataTableWidget(title: "My Data table")}
    ];

    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
              height: constraints.maxHeight * 3.5,
              width: double.maxFinite,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0)),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Text(
                      "Flutter Beginner",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    constraints.maxWidth > 600
                        ? Row(
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
                          )
                        : Column(
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
                        height: constraints.maxWidth < 600 ? 650 : 450,
                        width: double.maxFinite,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Colors.grey.shade100),
                        child: Wrap(
                          spacing: 6.0,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            for (int i = 0; i < widgetsGroup.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyChip((i + 1).toString(), widgetsGroup[i]["topic"],
                                    onPressed: () => Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => widgetsGroup[i]["navigator"]))),
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
                        height: constraints.maxWidth < 600 ? 650 : 450,
                        width: double.maxFinite,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Colors.grey.shade100),
                        child: Wrap(
                          spacing: 6.0,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            for (int i = 0; i < layoutGroup.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyChip((i + 1).toString(), layoutGroup[i]["topic"],
                                    onPressed: () => Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => layoutGroup[i]["navigator"]))),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text("Input พื้นฐาน", style: Theme.of(context).textTheme.titleLarge),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                      child: Container(
                        height: 250,
                        width: double.maxFinite,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(7.0), color: Colors.grey.shade100),
                        child: Wrap(
                          spacing: 6.0,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            for (int i = 0; i < inputGroup.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyChip((i + 1).toString(), inputGroup[i]["topic"],
                                    onPressed: () => Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => inputGroup[i]["navigator"]))),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
