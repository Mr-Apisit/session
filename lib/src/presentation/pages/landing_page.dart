import 'package:flutter/material.dart';

import '../features/state_ful.dart';
import '../features/state_less.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 450,
          width: double.maxFinite - 20,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    borderRadius: BorderRadius.circular(7.0),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => const StateFul(title: "State full widget")));
                    },
                    child: Text(
                      "State full widget",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    borderRadius: BorderRadius.circular(7.0),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => StateLess(title: "State less widget")));
                    },
                    child: Text("State less widget", style: Theme.of(context).textTheme.titleLarge)),
              ),
            ],
          )),
    );
  }
}
