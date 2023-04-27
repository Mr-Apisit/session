import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String title;
  const ContainerWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
            child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                  colors: [Colors.lightBlue, Colors.lightBlue.shade50],
                  stops: const [0.1, 0.5],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
        )));
  }
}
