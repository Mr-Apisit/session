import 'package:flutter/material.dart';

class FooterLayout extends StatelessWidget {
  const FooterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 60,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            children: const [
              Icon(Icons.eco_rounded),
              SizedBox(width: 5),
              Text("Footer"),
            ],
          ),
    );
  }
}
