import 'package:flutter/material.dart';

class LocalImageWidget extends StatelessWidget {
  final String title;
  const LocalImageWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: Container(
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                image: const DecorationImage(fit: BoxFit.contain, image: AssetImage("images/logo.png"))),
          ),
        ));
  }
}
