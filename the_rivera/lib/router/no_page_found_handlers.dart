import 'package:flutter/material.dart';

class NoPageFoundScreen extends StatelessWidget {
  const NoPageFoundScreen({super.key});

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 120,
                  color: Colors.brown[300],
                ),
                const SizedBox(height: 30),
                const Text(
                  '404',
                  style: TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B5A2B),
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Página no encontrada',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5C3A1E),
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Lo sentimos, la página que buscas no existe',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8B7355),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B5A2B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Volver al inicio',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}