import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

class ServiciosView extends StatelessWidget {
  const ServiciosView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título principal centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'NUESTROS SERVICIOS',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 395,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 50),
            
            // Sección de servicios
            _buildServicesSection(),
            
            const SizedBox(height: 60),
            
            // Subtítulo centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'SERVICIOS ESPECIALIZADOS',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 410,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildSpecializedServices(),
            
            const SizedBox(height: 60),
            
            // Subtítulo centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'PAQUETES PROMOCIONALES',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                    fontFamily: 'Georgia',
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  width: 415,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildPromoPackages(),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesSection() {
    final List<Map<String, dynamic>> services = [
      {'name': 'Corte Hombre', 'price': '\$130 MXN', 'duration': '30 min', 'icon': Icons.content_cut},
      {'name': 'Corte Mujer', 'price': '\$170 MXN', 'duration': '45 min', 'icon': Icons.face},
      {'name': 'Corte Niños', 'price': '\$120 MXN', 'duration': '25 min', 'icon': Icons.child_care},
      {'name': 'Barba', 'price': '\$80 MXN', 'duration': '20 min', 'icon': Icons.style},
      {'name': 'Diseño de Color', 'price': 'desde \$480 MXN', 'duration': '60 min', 'icon': Icons.color_lens},
      {'name': 'Permanente', 'price': 'desde \$400 MXN', 'duration': '90 min', 'icon': Icons.cyclone},
      {'name': 'Secado con Secadora', 'price': 'desde \$150 MXN', 'duration': '30 min', 'icon': Icons.air},
      {'name': 'Cejas y Perfilado', 'price': '\$60 MXN', 'duration': '15 min', 'icon': Icons.remove_red_eye},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return _buildServiceCard(
          service['name'].toString(),
          service['price'].toString(),
          service['duration'].toString(),
          service['icon'] as IconData,
        );
      },
    );
  }

  Widget _buildServiceCard(String name, String price, String duration, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: const Color(0xFFD4A373)),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE8B86B),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            duration,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFF5E6D3),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecializedServices() {
    final List<String> services = [
      'Corte de Caballero: Cortes de la escuela clásica con duración de 30 minutos.',
      'Corte de Dama: Amplia variedad de estilos incluyendo buzz, pixie, bob, lob, capas, degradado, V, U, recta o cuadrada.',
      'Corte de Niños: Servicio especializado para los más pequeños.',
      'Barba: Diseño de barba con uso de toalla caliente, afeitado, delineado y mantenimiento.',
      'Diseño de Color: Servicios de colorimetría con opciones ajustadas a tu presupuesto.',
      'Permanente: Limpieza del cabello, encarretado según tipo de rizo, aplicación de lociones y enjuague.',
      'Secado con Secadora: Lavado de cabello, secado y moldeado profesional.',
    ];

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
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle, color: Color(0xFFD4A373), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    services[index],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFF5E6D3),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoPackages() {
    final List<Map<String, dynamic>> packages = [
      {'name': 'Corte + Barba', 'price': '\$180 MXN', 'saving': 'Ahorro del 14%'},
      {'name': 'Corte + Color', 'price': '\$550 MXN', 'saving': 'Ahorro del 20%'},
      {'name': 'Pack Familiar (2 cortes)', 'price': '\$220 MXN', 'saving': 'Ahorro del 15%'},
      {'name': 'Pack Premium (Corte + Barba + Color)', 'price': '\$650 MXN', 'saving': 'Ahorro del 25%'},
      {'name': 'Pack Pareja (2 cortes)', 'price': '\$250 MXN', 'saving': 'Ahorro del 18%'},
      {'name': 'Membresía The Rivera', 'price': '\$500 MXN/mes', 'saving': '4 cortes incluidos'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final package = packages[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xFFD4A373).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                package['name'].toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A373),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                package['price'].toString(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE8B86B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A373).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  package['saving'].toString(),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFFF5E6D3),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}