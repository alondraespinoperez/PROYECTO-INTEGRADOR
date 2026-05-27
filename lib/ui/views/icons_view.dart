import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:the_rivera_barberia/ui/widgets/custom_title.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: 'ICONOS Y SERVICIOS'),
            const SizedBox(height: 40),
            _buildIconsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconsGrid() {
    final List<Map<String, dynamic>> icons = [
      {'icon': Icons.content_cut, 'title': 'Corte de Cabello', 'description': 'Estilos modernos y clásicos'},
      {'icon': Icons.face, 'title': 'Corte Mujer', 'description': 'Tendencias femeninas'},
      {'icon': Icons.child_care, 'title': 'Corte Niños', 'description': 'Para los más pequeños'},
      {'icon': Icons.style, 'title': 'Barba', 'description': 'Diseño y mantenimiento'},
      {'icon': Icons.color_lens, 'title': 'Colorimetría', 'description': 'Color para cabello'},
      {'icon': Icons.air, 'title': 'Secado', 'description': 'Lavado y secado profesional'},
      {'icon': Icons.cyclone, 'title': 'Permanente', 'description': 'Rizos definidos'},
      {'icon': Icons.stars, 'title': 'Paquetes', 'description': 'Promociones especiales'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final item = icons[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'] as IconData, size: 48, color: const Color(0xFF8B5A2B)),
              const SizedBox(height: 12),
              Text(
                item['title'].toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C3A1E),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                item['description'].toString(),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF8B7355),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}