import 'package:flutter/material.dart';

class CustomLabels {
  static TextStyle h1 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFF5C3A1E),
    fontFamily: 'Georgia',
  );

  static TextStyle h2 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF5C3A1E),
    fontFamily: 'Georgia',
  );

  static TextStyle h3 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color(0xFF5C3A1E),
    fontFamily: 'Georgia',
  );

  static TextStyle h4 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF5C3A1E),
  );

  static TextStyle title = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF8B5A2B),
  );

  static TextStyle subtitle = const TextStyle(
    fontSize: 14,
    color: Color(0xFF8B7355),
  );

  static TextStyle body = const TextStyle(
    fontSize: 14,
    color: Color(0xFF5C3A1E),
    height: 1.5,
  );

  static TextStyle bodySmall = const TextStyle(
    fontSize: 12,
    color: Color(0xFF8B7355),
  );

  static TextStyle button = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 1,
  );

  static TextStyle link = const TextStyle(
    fontSize: 14,
    color: Color(0xFF8B5A2B),
    decoration: TextDecoration.underline,
  );

  static TextStyle error = const TextStyle(
    fontSize: 12,
    color: Colors.red,
  );

  static TextStyle success = const TextStyle(
    fontSize: 12,
    color: Colors.green,
  );
}