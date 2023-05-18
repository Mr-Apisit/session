import 'package:flutter/material.dart';


  /// [myThirdWidgets] เป็น Widget ?ี่สร้างขึ้นเองเพื่อ return ตาราง [GridView] โดยกำหนดให้มี 3 แถว [crossAxisCount] ห่างกัน 7 [mainAxisSpacing]
  /// เว้นกัน 10[crossAxisSpacing] และทำ การ loop ใน [children] เพื่อแสดงผล [Container] ที่มี [child] เป็น [Column] และมีองค์ประกอบอยู่ใน [children]
  ///
class MyThirdWidget extends StatelessWidget {
  const MyThirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 7.0,
        childAspectRatio: 1.3,
        children: [
          for (int i = 1; i < 10; i++)
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FlutterLogo(),
                  const SizedBox(height: 5),
                  Text("รายการ $i"),
                ],
              ),
            )
        ],
      ),
    );
  }
}

  /// [myFourthWidget] เป็น widget ที่สร้างขึ้นเองเพื่อ return [SizedBox] เพื่อให้โครงสร้างแก่ [Column]
  /// ที่เป็น [child] ทำการ loop องค์ประกอบภ่ยใน [children] ของ [Column] เอง
  ///
class MyFourthWidget extends StatelessWidget {
  const MyFourthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          for (int i = 1; i < 20; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const FlutterLogo(size: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("หัวข้อ ........... $i"), const Text("คำอธิบาย.................")],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
