import 'dart:async';

import 'package:flutter/material.dart';

Future<int> incrementCounter(int counter) async {
  await Future.delayed(const Duration(seconds: 3));
  return counter + 1;
}

class FutureWidget extends StatelessWidget {
  final String title;
  const FutureWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              FutureBuilder<int>(
                  future: incrementCounter(counter),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${snapshot.data ?? 0}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => incrementCounter(1),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
