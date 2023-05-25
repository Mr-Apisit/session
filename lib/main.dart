import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:session/pages/success_page.dart';
import 'package:session/widgets/custom_button.dart';

import 'pages/error_page.dart';

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

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String answer = "wait to answer";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ค่าของ 2 + (3x4) ตรง\nกับข้อใด?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 25),
            Text(answer),
            const SizedBox(height: 70),
            CustomButton(
              icon: const Icon(
                CupertinoIcons.circle,
                size: 24,
                color: Colors.red,
              ),
              label: Text("12", style: Theme.of(context).textTheme.titleMedium),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ErrorPage()));
              },
            ),
            const SizedBox(height: 25),
            CustomButton(
              icon: const Icon(
                CupertinoIcons.triangle,
                color: Colors.green,
                size: 24,
              ),
              label: Text("13", style: Theme.of(context).textTheme.titleMedium),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ErrorPage()));
              },
            ),
            const SizedBox(height: 25),
            CustomButton(
              icon: const Icon(
                CupertinoIcons.rectangle,
                size: 24,
                color: Colors.pink,
              ),
              label: Text("14", style: Theme.of(context).textTheme.titleMedium),
              onPressed: () async {
                String value = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SucessPage(answer: (value) {});
                }));
                setState(() {
                  answer = value;
                });
              },
            ),
            const SizedBox(height: 25),
            CustomButton(
              icon: const Icon(
                CupertinoIcons.star,
                size: 24,
                color: Colors.amber,
              ),
              label: Text("15", style: Theme.of(context).textTheme.titleMedium),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ErrorPage()));
              },
            ),
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
