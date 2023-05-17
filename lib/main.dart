import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///  cunc. [unawaited] นี้มีไว้เพื่อบอกให้ไม่จำเป็นต้องรอ func ภายในเงื่อนไขนี้เสร็จก่อน
///  โดย Application นี้ต้องการมุมมองจอภาพเพียงแค่ "แนวตั้ง" 
    /// * จำเป็นต้องมี [WidgetsFlutterBinding.ensureInitialized] เพื่ออนุญาตกระบวนการนั้น
    /// * set [DeviceOrientation.portraitUp] ใน [SystemChrome.setPreferredOrientations]
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Flutter app'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
