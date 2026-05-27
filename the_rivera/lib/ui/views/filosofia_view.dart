import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

class FilosofiaView extends StatelessWidget {
  const FilosofiaView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título centrado con línea amarilla debajo
            const Text(
              'NUESTRA FILOSOFÍA',
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
            Container(
              width: 372,
              height: 2,
              color: const Color(0xFFE8B86B),
            ),
            const SizedBox(height: 40),
            
            // Contenido de la filosofía
            const Text(
              'En THE RIVERA, creemos que cada cliente merece atención personalizada y resultados excepcionales. '
              'Nos enfocamos en entender tus necesidades y superar tus expectativas, utilizando productos de primera calidad '
              'y técnicas que garantizan tu satisfacción.\n\n'
              'Nuestra filosofía se basa en tres pilares fundamentales: calidad, innovación y compromiso. '
              'Creemos que la combinación de estos elementos es la clave para ofrecer un servicio excepcional '
              'que marque la diferencia en la vida de cada persona que confía en nosotros.\n\n'
              'Nos apasiona lo que hacemos, y ese amor por nuestro trabajo se refleja en cada detalle: '
              'desde la atención que brindamos hasta los productos que utilizamos. '
              'Tu satisfacción es nuestra mayor recompensa.\n\n'
              'En THERIVERA, no solo te ofrecemos un servicio de barbería y peluquería, sino una experiencia completa '
              'donde te sentirás renovado y con un estilo que refleja tu personalidad.',
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
                color: Color(0xFFF5E6D3),
              ),
              textAlign: TextAlign.justify,
            ),
            
            const SizedBox(height: 60),
            
            // Valores - Igual que Misión y Visión en Nosotros
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildValueCard(
                    icon: Icons.thumb_up,
                    title: 'CALIDAD',
                    description: 'Utilizamos productos de primera calidad y técnicas profesionales '
                        'para garantizar resultados excepcionales en cada servicio.',
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _buildValueCard(
                    icon: Icons.lightbulb,
                    title: 'INNOVACIÓN',
                    description: 'Nos mantenemos actualizados con las últimas tendencias y técnicas '
                        'para ofrecerte siempre lo mejor en el mundo de la barbería.',
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 30),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildValueCard(
                    icon: Icons.favorite,
                    title: 'PASIÓN',
                    description: 'Amamos lo que hacemos y eso se refleja en cada corte, '
                        'cada arreglo de barba y cada servicio que brindamos.',
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: _buildValueCard(
                    icon: Icons.handshake,
                    title: 'COMPROMISO',
                    description: 'Nos comprometemos con tu satisfacción y bienestar, '
                        'superando siempre tus expectativas.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildValueCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: const Color(0xFFD4A373)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFF5E6D3),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}