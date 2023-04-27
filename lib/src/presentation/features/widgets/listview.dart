import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final String title;
  const ListViewWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: Container(
        width: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              tileColor: Colors.grey.shade50,
              title: Text('List column ที่ $index'),
            );
          },
        ),
      )),
    );
  }
}
