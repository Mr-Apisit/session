import 'package:flutter/material.dart';

import 'layouts/footer.dart';
import 'layouts/header.dart';
import 'layouts/layout.dart';
import 'layouts/sub_header.dart';

class LayoutAdaptive extends StatefulWidget {
  final String title;
  const LayoutAdaptive(this.title, {super.key});

  @override
  State<LayoutAdaptive> createState() => _LayoutAdaptiveState();
}

class _LayoutAdaptiveState extends State<LayoutAdaptive> {
  late String detail;
  late String menu;
  late String subMenu;
  @override
  void initState() {
    detail = "";
    menu = "เมนูที่ : 1";
    subMenu = "เมนูย่อยที่ : 1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Icon(Icons.radar_outlined),
                        const SizedBox(width: 5),
                        Text(widget.title),
                      ],
                    )),
                trailing: const Icon(Icons.arrow_back_ios),
                onTap: () => Navigator.pop(context),
              ),
              for (var i = 1; i < 4; i++)
                ListTile(
                  title: Text("$menu เมนูย่อยที่ : $i"),
                  onTap: () {
                    setState(() {
                      subMenu = " $menu เมนูย่อยที่ : $i";
                    });
                    Navigator.pop(context);
                  },
                )
            ],
          ),
        ),
      ),
      body: AdaptiveLayout(
        tiny: const Center(
          child: Icon(Icons.not_interested),
        ),
        phone: Column(
          children: [
            const HeaderLayout(),
            SubHeader(
              fullscreen: false,
              subMenu: subMenu,
              getMenu: (value) {
                setState(() {
                  menu = value;
                });
              },
            ),
            Expanded(child: VerticalListWidget(widget.title)),
            const FooterLayout(),
          ],
        ),
        tablet: Column(
          children: [
            const HeaderLayout(),
            SubHeader(
              fullscreen: false,
              subMenu: subMenu,
              getMenu: (value) {
                setState(() {
                  menu = value;
                });
              },
            ),
            Expanded(child: VerticalListWidget(widget.title)),
            const FooterLayout(),
          ],
        ),
        largeTablet: Column(
          children: [
            const HeaderLayout(),
            SubHeader(
              fullscreen: true,
              subMenu: subMenu,
              getMenu: (value) {
                setState(() {
                  menu = value;
                });
              },
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() {
                                detail = index.toString();
                              }),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Center(child: Text("list on $index.")),
                              ),
                            );
                          })),
                  Expanded(
                      flex: 4,
                      child: Center(
                        child: Text("เลือก .... $detail"),
                      ))
                ],
              ),
            ),
            const FooterLayout(),
          ],
        ),
        computer: Column(
          children: [
            const HeaderLayout(),
            SubHeader(
              fullscreen: true,
              subMenu: subMenu,
              getMenu: (value) {
                setState(() {
                  menu = value;
                });
              },
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() {
                                detail = index.toString();
                              }),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Center(child: Text("list on $index.")),
                              ),
                            );
                          })),
                  Expanded(flex: 3, child: Center(child: Text("เลือก .... $detail"))),
                ],
              ),
            ),
            const FooterLayout(),
          ],
        ),
      ),
    );
  }
}

class VerticalListWidget extends StatelessWidget {
  final String title;
  const VerticalListWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(title, index: index))),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(child: Text("list on $index.")),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  final int index;
  const DetailsPage(this.title, {required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Text(
        "เลือก .... $index",
        style: Theme.of(context).textTheme.titleMedium,
      )),
    );
  }
}
