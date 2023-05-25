import 'package:flutter/material.dart';
import 'package:session/widgets/custom_button.dart';

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
        iconTheme: const IconThemeData(color: Colors.black),
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
            CustomButton(
              label: Text(
                "Back to question page",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
