import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final String title;
  const TextInputWidget({required this.title, super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  String text = "รอ ...";
  TextEditingController type = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void onSearchTextChanged(String value) {
      setState(() {
        value.isEmpty ? text = "รอ ..." : text = value;
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              controller: type,
              decoration: const InputDecoration(
                hintText: 'ค้นหา...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => onSearchTextChanged(value),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(text)
        ],
      )),
    );
  }
}
