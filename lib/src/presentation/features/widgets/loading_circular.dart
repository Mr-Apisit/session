import 'package:flutter/material.dart';

class CircularLoadingWidget extends StatelessWidget {
  final String title;
  const CircularLoadingWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
