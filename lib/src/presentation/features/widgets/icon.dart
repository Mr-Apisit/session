import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final String title;
  const IconWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Icon(Icons.wechat_outlined),
      ),
    );
  }
}
