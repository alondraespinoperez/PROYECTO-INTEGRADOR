import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  
  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFDF8F0),
              Color(0xFFF5E6D3),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo de THE RIVERA
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.content_cut,
                          size: 80,
                          color: Colors.brown[700],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'THE RIVERA',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B5A2B),
                            fontFamily: 'Georgia',
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'CORTES MEN & GIRLS CARÁCTER',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8B7355),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Contenido del formulario
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}