import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF8B5A2B)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0D5C0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE0D5C0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF8B5A2B), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Color(0xFF8B7355)),
      hintStyle: const TextStyle(color: Color(0xFFD4A373)),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: const Icon(Icons.search, color: Color(0xFF8B5A2B)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xFFFDF8F0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    );
  }
}