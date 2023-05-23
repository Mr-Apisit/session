import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///  cunc. [unawaited] นี้มีไว้เพื่อบอกให้ไม่จำเป็นต้องรอ func ภายในเงื่อนไขนี้เสร็จก่อน
///  โดย [Application] นี้ต้องการมุมมองจอภาพเพียงแค่ "แนวตั้ง"
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
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',

      /// [MyHomePage]
      home: Demo(),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ค่าของ 2 + (3x4) ตรง\nกับข้อใด?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 70),
            button(
              context,
              icon: const Icon(
                CupertinoIcons.circle,
                size: 24,
                color: Colors.red,
              ),
              choice: "12",
              selected: false,
            ),
            const SizedBox(height: 25),
            button(
              context,
              icon: const Icon(
                CupertinoIcons.triangle,
                color: Colors.green,
                size: 24,
              ),
              choice: "13",
              selected: false,
            ),
            const SizedBox(height: 25),
            button(
              context,
              icon: const Icon(
                CupertinoIcons.rectangle,
                size: 24,
                color: Colors.pink,
              ),
              choice: "14",
              selected: true,
            ),
            const SizedBox(height: 25),
            button(
              context,
              icon: const Icon(
                CupertinoIcons.star,
                size: 24,
                color: Colors.amber,
              ),
              choice: "15",
              selected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget button(
    BuildContext context, {
    required Widget icon,
    required String choice,
    required bool selected,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => selected ? const SucessPage() : const ErrorPage()));
      },
      child: Container(
        height: 80,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.only(right: 70.0), child: icon),
            Padding(
                padding: const EdgeInsets.only(left: 70.0),
                child: Text(choice, style: Theme.of(context).textTheme.titleMedium))
          ],
        ),
      ),
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Result",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.close_outlined,
              size: 80,
              color: Colors.red,
            ),
            SizedBox(
              height: 100,
            ),
            Text("You choose incorrect answer.")
          ],
        ),
      ),
    );
  }
}

class SucessPage extends StatelessWidget {
  const SucessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Result",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text("You choose correct answer."),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade100, Colors.yellowAccent, Colors.white],
                    stops: const [0.1, 0.15, 1.0],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text("OK"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// class Name extends StatelessWidget {
//   final String title;
//   final String description;
//   final Color bodyColor;
//   final Color textColor;
//   const Name(this.description, {required this.title, required this.textColor, required this.bodyColor, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: Container(
//           width: 100,
//           height: 100,
//           color: bodyColor,
//           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
//           child: Text(
//             description,
//             style: TextStyle(color: textColor),
//           ),
//         ),
//       ),
//     );
//   }
// }

// /// [MyHomePage] เป็น class widget หลักในการแสดงผลซึ่ง
// /// class ได้ inheritance  มาจาก class [StatelessWidget]
// /// มี [title] เป็น Map<String,String> ชื่อ app เพื่อนำไปใช้กับ Class ที่กล่าวอ้างถึง
// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({required this.title, super.key});

//   /// สำหรับ Application page จะต้องเริ่มต้นด้วย [Scaffold] class เพื่อการใช้งานที่ง่ายและสะดวก
//   /// [extendBodyBehindAppBar] เป็นค่ากำหนดจะให้ [body] ทะลุ [AppBar]
//   /// โดยไอเจ้า [Scaffold] เองจะมี key [appBar] มาให้เราใส่ [AppBar] ได้
//   /// [AppBar] จะมี key [actions] เพื่อให้เราใส่ [Icon] หรือ [IconButton] และ[Widget] อื่นๆ ได้ดีก
//   /// และ key [body] ไว้ใส้ Layout class เช่น [Container], [SizedBox] , [SingleChildScrollView]

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: false,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         elevation: 0,
//         backgroundColor: Colors.grey,
//         title: Text(
//           title,
//           style: const TextStyle(color: Colors.black),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: Icon(Icons.notifications_active),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: Icon(Icons.person_4_rounded),
//           ),
//         ],
//       ),
//       body: myView(),
//     );
//   }

//   /// [myView] เป็น widget ที่สร้างขึนเองเพื่อโดยจะ return [SingleChildScrollView] ที่เป็นตัวสร้างการ [Scrolling]
//   /// โดยจะมี [child] เป็น [Column] เพื่อแสดงผล [List] ในแนวตั้ง
//   ///
//   ///

//   Widget myView() {
//     return Container(
//       width: double.infinity,
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 25),
//             myFirstWidgets(),
//             const SizedBox(height: 25),
//             mySecondWidgets(),
//             const SizedBox(height: 25),
//             const MyThirdWidget(),
//             const SizedBox(height: 15),
//             const MyFourthWidget()
//           ],
//         ),
//       ),
//     );
//   }

//   /// [myFirstWidgets] คือ Widget ที่ทำการสร้างเองและ return [Container] ออกไปซึ่งมี [child] เป็น [Row] ที่ทำการ [loop] [Padding] ที่มี [child] เป็นองค์ประกอบของ รายการ เมนู
//   Widget myFirstWidgets() {
//     return Container(
//       height: 80,
//       width: 340,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//           color: Colors.black12, borderRadius: BorderRadius.circular(12)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           for (int i = 1; i < 5; i++)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 50,
//                 child: Column(children: [
//                   const FlutterLogo(),
//                   Text("รายการ $i"),
//                 ]),
//               ),
//             )
//         ],
//       ),
//     );
//   }

//   /// [mySecondWidgets] คือ Widget ที่ทำการสร้างเองและ return [SizedBox] ออกไปซึ่งมี [child] เป็น [SingleChildScrollView]
//   /// เพื่อ scrolling [Row] ที่เป็น [child]ของตัวเอง โดยทำการ For loop [Padding] ที่มี [child] เป็นองค์ประกอบของ รายการ ภาพสไลด์
//   ///
//   Widget mySecondWidgets() {
//     return SizedBox(
//       height: 150,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             for (int i = 1; i < 5; i++)
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: 150,
//                   width: 320,
//                   decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: const FlutterLogo(),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
