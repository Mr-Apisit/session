import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  final String index;
  final String topic;
  final VoidCallback onPressed;
  const MyChip(this.index, this.topic, {required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      elevation: .8,
      pressElevation: 2,
      onPressed: onPressed,
      padding: const EdgeInsets.all(8),
      shadowColor: Colors.grey.shade100,
      backgroundColor: Colors.white.withOpacity(.3),
      side: const BorderSide(color: Colors.transparent),
      avatar: Container(
        width: 30,
        padding: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          index,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ), //CircleAvatar
      label: Text(
        topic,
        style: Theme.of(context).textTheme.titleLarge,
      ), //Text
    );
  }
}
