import 'package:flutter/material.dart';

class CenterWidget extends StatelessWidget {
  final String title;
  const CenterWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child: Center(
            child: Container(
              width: 250,
              height: 250,
              color: Colors.grey.shade200,
              child: Center(
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.greenAccent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
