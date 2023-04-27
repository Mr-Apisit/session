import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  final String title;
  const SizedBoxWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: SizedBox(width: 500, height: 100, child: Placeholder()),
      ),
    );
  }
}
