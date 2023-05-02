import 'package:flutter/material.dart';

class SubHeader extends StatefulWidget {
  final bool fullscreen;
  final String subMenu;
  final void Function(String) getMenu;
  const SubHeader({required this.fullscreen, required this.subMenu, required this.getMenu, super.key});

  @override
  State<SubHeader> createState() => _SubHeaderState();
}

class _SubHeaderState extends State<SubHeader> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> menus = ["เมนูที่ : 1", "เมนูที่ : 2", "เมนูที่ : 3", "เมนูที่ : 4"];

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: menus.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const Icon(Icons.radar_outlined),
                    const SizedBox(width: 5),
                    Text(widget.subMenu),
                  ],
                )),
          ),
        ),
        widget.fullscreen
            ? Expanded(
                flex: 2,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
                  indicatorColor: Colors.red,
                  controller: _tabController,
                  labelColor: Colors.black,
                  isScrollable: false,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  onTap: (index) => widget.getMenu(menus[index]),
                  tabs: [
                    for (final tab in menus) Tab(text: tab),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: PopupMenuButton<String>(
                    elevation: 1,
                    icon: const Icon(Icons.navigate_before_outlined),
                    padding: EdgeInsets.zero,
                    onSelected: (value) {},
                    itemBuilder: (context) {
                      return <PopupMenuEntry<String>>[
                        for (final menu in menus)
                          PopupMenuItem<String>(
                            value: menu,
                            child: Text(
                              menu,
                            ),
                            onTap: () => widget.getMenu(menu),
                          ),
                      ];
                    }),
              ),
      ],
    );
  }
}
