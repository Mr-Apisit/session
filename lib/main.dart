import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session/src/constants/colors.dart';
import 'package:session/src/constants/contents.dart';
import 'package:session/src/constants/icons.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  /// State of index widget screen [List][widgets]
  int indexWidget = 0;
  
  // Input controller to handle text input
  TextEditingController search = TextEditingController();
  
  /// Control screen by [indexWidget]
  /// first is main screen show title [Appcontents.app]
  /// Second is second Widget in [widgets] 
    /// show seach box [Appcontents.search]
    /// with [CupertinoSearchTextField]
    /// 
  List<Widget> widgets = [
    Center(child: Text(Appcontents.home)),
    Center(child: Text(Appcontents.search))
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Appcontents.app,
      theme: ThemeData(
        primarySwatch: AppColors.genMaterialColor(
          AppColors.primary,
        ),
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: indexWidget == 1
                ? CupertinoSearchTextField(
                    controller: search,
                    placeholder: Appcontents.search,
                    backgroundColor: AppColors.background,
                  )
                : Text(Appcontents.app)),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: Appcontents.home,
              icon: const FaIcon(
                AppIcons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: Appcontents.search,
              icon: const FaIcon(
                AppIcons.search,
              ),
            ),
          ],
          currentIndex: indexWidget,
          onTap: (index) => setState(() {
            indexWidget = index;
          }),
        ),
        body: widgets[indexWidget],
      ),
    );
  }
}
