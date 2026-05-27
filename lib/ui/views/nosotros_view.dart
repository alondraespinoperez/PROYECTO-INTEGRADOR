import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

class NosotrosView extends StatelessWidget {
  const NosotrosView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título centrado con línea amarilla debajo que abarca todo el texto
            const Text(
              'SOBRE NOSOTROS',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A373),
                fontFamily: 'Georgia',
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            // Línea amarilla que abarca el ancho del texto
            Container(
              width: 335,
              height: 2,
              color: const Color(0xFFE8B86B),
            ),
            const SizedBox(height: 40),
            
            // Contenido de la historia - SIN "NUESTRA HISTORIA"
            const Text(
              'THE RIVERA nació de la pasión por el arte de la barbería y peluquería, '
              'con la visión de ofrecer un espacio donde cada cliente se sienta especial '
              'y renovado.\n\n'
              'Fundada por Sergio Rivera, nuestra barbería combina técnicas tradicionales '
              'con tendencias modernas, creando estilos únicos que reflejan la personalidad '
              'de cada persona.\n\n'
              'Hoy, somos un equipo de profesionales dedicados a brindar la mejor experiencia '
              'en cuidado personal, utilizando productos de primera calidad y técnicas '
              'innovadoras que garantizan resultados excepcionales.',
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
                color: Color(0xFFF5E6D3),
              ),
              textAlign: TextAlign.justify, // Texto justificado
            ),
            
            const SizedBox(height: 60),
            
            // Misión y Visión
            Row(
              children: [
                Expanded(child: _buildMissionCard()),
                const SizedBox(width: 30),
                Expanded(child: _buildVisionCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.visibility, size: 50, color: Color(0xFFD4A373)),
          const SizedBox(height: 16),
          const Text(
            'MISIÓN',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Brindar servicios de barbería y peluquería de excelencia, '
            'superando las expectativas de nuestros clientes con '
            'atención personalizada y productos de calidad.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFF5E6D3),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          const Icon(Icons.flag, size: 50, color: Color(0xFFD4A373)),
          const SizedBox(height: 16),
          const Text(
            'VISIÓN',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Ser la barbería de referencia en la región, reconocida por '
            'la calidad de nuestros servicios y la satisfacción de nuestros clientes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFF5E6D3),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}