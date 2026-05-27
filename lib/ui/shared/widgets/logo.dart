import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  final bool showText;

  const Logo({
    super.key,
    this.size = 60,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFD4A373).withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.content_cut,
            size: size,
            color: const Color(0xFFD4A373),
          ),
        ),
        if (showText) ...[
          const SizedBox(height: 12),
          const Text(
            'THE RIVERA',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              fontFamily: 'Georgia',
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'MEN & GIRLS',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFFF5E6D3),
              letterSpacing: 1,
            ),
          ),
        ],
      ],
    );
  }
}