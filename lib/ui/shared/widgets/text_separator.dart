import 'package:flutter/material.dart';

class TextSeparator extends StatelessWidget {
  final double height;

  const TextSeparator({
    super.key,
    this.height = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: const Color(0xFFD4A373),
    );
  }
}