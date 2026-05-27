import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? color;

  const CustomTitle({
    super.key,
    required this.title,
    this.fontSize = 32,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: color ?? const Color(0xFFD4A373),
              fontFamily: 'Georgia',
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            width: 80,
            height: 2,
            color: const Color(0xFFE8B86B),
          ),
        ),
      ],
    );
  }
}