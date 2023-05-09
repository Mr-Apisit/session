import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import './model.dart';
import './constants.dart';
// import 'src/presentation/pages/_landing_page.dart';

void main() async {
  // await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Flutter Demo',
        theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 211, 211, 211)),
        // home: const LandingPage(),
        home: const Example1());
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    // final data = List.from(travelList).map((e) => TravelModel.fromJson(e));
    return Material(
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 380,
            minHeight: 150,
            maxHeight: 200,
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: const Text("Demo 1"),
          ),
        ),
      ),
    );
  }
}
