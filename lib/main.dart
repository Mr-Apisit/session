import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import './model.dart';
import './constants.dart';
import 'src/presentation/pages/_landing_page.dart';
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
      home: const Example1(),
    );
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    // final data = List.from(travelList).map((e) => TravelModel.fromJson(e));

    // final Widget image = Semantics(
    //   label: '${data.first.id} ${data.first.user}',
    //   child: Material(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    //     clipBehavior: Clip.antiAlias,
    //     child: Image.network(
    //       data.first.webformatUrl,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );

    return Material(
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 300,
            maxWidth: 400,
            minHeight: 650,
            maxHeight: 950,
          ),
          child: Container(
            height: 700,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: Color(0xFFFFFFF0)),
            child: SizedBox(
              height: 150,
              width: 250,
              // color: Colors.red.withOpacity(0.5),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://pixabay.com/get/g54e2c3cd12dc3581b81d65262950e99d59e12f52f75be48d1f1b798d48e0a67fb3fc80626ea54015663252f12098da237f9e2865dc4984a2e752bd65458696af_640.jpg",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Container(
                      height: 30,
                      width: 20,
                      decoration: const BoxDecoration(
                        // color: Colors.black,
                        image: DecorationImage(
                          opacity: .4,
                          image: AssetImage("images/logo.png"),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 10,
                    child: Text(
                      "Is' me Gugu",
                      style: TextStyle(color: Colors.white.withOpacity(.7)),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 10,
                    child: Text(
                      "Is' me Gugu",
                      style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(.4)),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: Text(
                      "Ref.Gugu",
                      style: TextStyle(fontSize: 6, color: Colors.white.withOpacity(.4)),
                    ),
                  ),
                ],
              ),
            ),
            // child: _stack(image),
          ),
        ),
      ),
    );
  }
}

class ExampleListCard extends StatelessWidget {
  const ExampleListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = List.from(travelList).map((e) => TravelModel.fromJson(e));

    return Material(
      child: ListView(
        children: [
          const SizedBox(
            height: 70,
            width: double.maxFinite,
          ),
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (TravelModel item in data)
                  CardWidget(
                    item.webformatUrl,
                    title: item.type,
                    tag: item.tags,
                    ref: item.user,
                    isHorizontal: false,
                  )
              ],
            ),
          ),
          SizedBox(
            height: 3000,
            child: ListView(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 10),
              scrollDirection: Axis.vertical,
              children: [
                for (TravelModel item in data)
                  CardWidget(
                    item.webformatUrl,
                    title: item.type,
                    tag: item.tags,
                    ref: item.user,
                    isHorizontal: true,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String picUrl;
  final String title;
  final String tag;
  final String ref;
  final bool isHorizontal;
  const CardWidget(
    this.picUrl, {
    required this.title,
    required this.tag,
    required this.ref,
    required this.isHorizontal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      padding: EdgeInsets.only(bottom: 15, left: isHorizontal ? 50 : 10, right: isHorizontal ? 50 : 10),
      // color: Colors.red.withOpacity(0.5),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    picUrl,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 10,
            child: Container(
              height: 30,
              width: 20,
              decoration: const BoxDecoration(
                // color: Colors.black,
                image: DecorationImage(
                  opacity: .4,
                  image: AssetImage("images/logo.png"),
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4.0),
                bottomRight: Radius.circular(4.0),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 10,
            child: Text(
              title,
              style: TextStyle(color: Colors.white.withOpacity(.9)),
            ),
          ),
          Positioned(
            bottom: 25,
            left: 10,
            child: Text(
              tag,
              style: TextStyle(fontSize: 10, color: Colors.white.withOpacity(.8)),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: Text(
              ref,
              style: TextStyle(fontSize: 6, color: Colors.white.withOpacity(.7)),
            ),
          ),
        ],
      ),
    );
  }
}
