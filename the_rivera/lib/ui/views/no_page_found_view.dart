import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_rivera_barberia/router/router.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({super.key});

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
                // Icono
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5E6D3),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    size: 100,
                    color: Color(0xFF8B5A2B),
                  ),
                ),
                const SizedBox(height: 40),
                
                // Código 404
                const Text(
                  '404',
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B5A2B),
                    fontFamily: 'Georgia',
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 5,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Mensaje principal
                const Text(
                  'Página no encontrada',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5C3A1E),
                    fontFamily: 'Georgia',
                  ),
                ),
                const SizedBox(height: 12),
                
                // Mensaje secundario
                const Text(
                  'Lo sentimos, la página que buscas no existe o ha sido movida',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8B7355),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                
                // Botón para volver al inicio
                ElevatedButton(
                  onPressed: () {
                    context.go(Routes.dashboard);
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
                    elevation: 3,
                  ),
                  child: const Text(
                    'VOLVER AL INICIO',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Botón secundario para ir a servicios
                TextButton(
                  onPressed: () {
                    context.go(Routes.servicios);
                  },
                  child: const Text(
                    'Ver nuestros servicios',
                    style: TextStyle(
                      color: Color(0xFF8B5A2B),
                    ),
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