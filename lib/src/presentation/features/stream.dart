import 'dart:async';

import 'package:flutter/material.dart';

StreamController<int> controller = StreamController<int>.broadcast();

class StreamWidget extends StatelessWidget {
  final String title;
  const StreamWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    void incrementCounter(int counter) {
      controller.add(counter + 1);
    }

    return StreamBuilder<int>(
        stream: controller.stream,
        builder: (context, snapshot) {
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
                  Text(
                    '${snapshot.data ?? 0}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => incrementCounter(snapshot.data ?? 0),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
