
import 'package:flutter/material.dart';

class StateLess extends StatelessWidget {
  final String title;
  const StateLess({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    int incrementCounter(int counter) {
      return counter + 1;
    }

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
              '$counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter = incrementCounter(counter);
          debugPrint(counter.toString());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
