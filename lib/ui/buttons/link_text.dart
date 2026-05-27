import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  const LinkText({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? const Color(0xFF8B5A2B),
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}