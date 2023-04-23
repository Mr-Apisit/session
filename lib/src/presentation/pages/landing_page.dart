import 'package:flutter/material.dart';

import '../features/state_ful.dart';
import '../features/state_less.dart';
import '../widgets/text_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite - 20,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.0)),
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Text(
                  "FLutter Beginner",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextButton(
                        text: "State ful widget",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const StateFul(
                                title: "State full widget",
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text("หรือ", style: Theme.of(context).textTheme.titleLarge),
                      ),
                      MyTextButton(
                        text: "State less widget",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const StateLess(
                                title: "State less widget",
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
