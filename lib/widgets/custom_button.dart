import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;

  final Widget label;
  final VoidCallback onPressed;
  const CustomButton({
    this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.grey.shade100, Colors.grey.shade200],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: SizedBox(
              height: 80,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  icon != null ? const SizedBox(width: 140) : const SizedBox.shrink(),
                  label,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
