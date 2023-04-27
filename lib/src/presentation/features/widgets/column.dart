import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  final String title;
  const ColumnWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        height: 500,
        color: Colors.grey.shade100,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 50,
                height: 100,
                padding: const EdgeInsets.all(12),
                color: Colors.grey.shade50,
                child: const Placeholder()),
            Container(
                width: 250,
                height: 100,
                padding: const EdgeInsets.all(12),
                color: Colors.grey.shade50,
                child: const Placeholder()),
            Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(12),
                color: Colors.grey.shade50,
                child: const Placeholder()),
          ],
        ),
      ),
    );
  }
}
