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
                            "https://pixabay.com/get/geffeb7f1b330b6287874d7767ff016f7dcd1adf5b3078b217ea70ed8f385ab233a59beb97f08f2fe6dbf3b9bec2ba6512c9a257ec08eb2a061eb9c5996b317df_640.jpg",
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

  // Widget _stack(Widget image) {
  //   return Stack(
  //     alignment: Alignment.bottomCenter,
  //     children: [
  //       image,
  //       const Text(
  //         "Hello world",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ],
  //   );
  // }
}
