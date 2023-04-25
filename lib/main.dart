import 'package:flutter/material.dart';

import 'src/presentation/pages/_landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorSchemeSeed: const Color.fromARGB(255, 211, 211, 211), useMaterial3: true),
      home: const LandingPage(),
    );
  }
}
