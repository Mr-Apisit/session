import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:session/src/constants/colors.dart';
import 'package:session/src/constants/contents.dart';
import 'package:session/src/constants/icons.dart';
import 'package:session/src/constants/sizes.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Appcontents.app,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.secondary,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(Appcontents.home),
              ),
              SizedBox(height: AppSizes.freeSpace),
              TextButton(
                onPressed: () {},
                child: Text(
                  Appcontents.search,
                  style: TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.freeSpace),
              FaIcon(AppIcons.home, size: AppSizes.iconLarge),
              SizedBox(height: AppSizes.freeSpace),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(AppIcons.home),
              )
            ],
          ),
        ),
      ),
    );
  }
}
