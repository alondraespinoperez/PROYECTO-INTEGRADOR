import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  final Widget child;
  
  const SplashLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B5A2B),
              Color(0xFF5C3A1E),
              Color(0xFF3A2210),
            ],
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}