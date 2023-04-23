import 'package:flutter/material.dart';


class MyTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MyTextButton({required this.text,required this.onTap,  super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(7.0),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );
  }
}
