import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:the_rivera_barberia/router/router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A0D06),
              Color(0xFF2C1810),
              Color(0xFF3D2314),
              Color(0xFF5C3A1E),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A373).withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.content_cut,
                  size: 80,
                  color: Color(0xFFD4A373),
                ),
              ),
              const SizedBox(height: 30),
              
              // Título principal
              const Text(
                'THE RIVERA',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A373),
                  fontFamily: 'Georgia',
                  letterSpacing: 4,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 8,
                      color: Colors.black38,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              
              // Línea decorativa
              Container(
                width: 80,
                height: 2,
                color: const Color(0xFFE8B86B),
              ),
              const SizedBox(height: 20),
              
              // Subtítulo
              const Text(
                'CORTES MEN & GIRLS',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFF5E6D3),
                  letterSpacing: 3,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              
              const Text(
                'CARÁCTER',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFD4A373),
                  letterSpacing: 5,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              
              // Botón
              ElevatedButton(
                onPressed: () {
                  context.go(Routes.agendaCita);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4A373),
                  foregroundColor: const Color(0xFF1A0D06),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 4,
                ),
                child: const Text(
                  'AGENDA TU CITA AHORA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}