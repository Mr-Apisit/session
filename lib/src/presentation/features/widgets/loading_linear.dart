import 'package:flutter/material.dart';

class LinearLoadingWidget extends StatelessWidget {
  final String title;
  const LinearLoadingWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: LinearProgressIndicator()),
    );
  }
}
