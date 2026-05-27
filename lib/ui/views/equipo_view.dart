import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

class EquipoView extends StatelessWidget {
  const EquipoView({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título centrado
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'NUESTRO EQUIPO',
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
                  width: 325,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 50),
            
            // Equipo - 2 arriba y 2 abajo
            _buildTeamGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamGrid() {
    final List<Map<String, dynamic>> team = [
      {
        'name': 'Alondra Espino Pérez', 
        'role': 'Lider de Proyecto y Desarrolladora Frontend', 
        'stars': 5, 
        'description': 'Encargada del liderazgo del proyecto y desarrollo de la interfaz de usuario',
        'image': 'assets/images/alondra.jpg',
        'initials': 'AEP',
        'skills': ['DART', 'FLUTTER', 'PYTHON', 'PROJECT MANAGEMENT', 'DEVOPS', 'GIT'],
      },
      {
        'name': 'Virginia Lizeth Quiroz Marquez', 
        'role': 'Diseñadora UI/UX', 
        'stars': 5, 
        'description': 'Especialista en diseño de interfaces atractivas y funcionales',
        'image': 'assets/images/virginia.jpg',
        'initials': 'VLQM',
        'skills': ['UI/UX', 'REACT', 'ILLUSTRATOR', 'HTML5', 'CSS3', 'JAVASCRIPT'],
      },
      {
        'name': 'Alejandro Martinez Luz', 
        'role': 'Desarrollador Backend', 
        'stars': 5, 
        'description': 'Encargado de la lógica y funcionamiento de la aplicación',
        'image': 'assets/images/alejandro.jpg',
        'initials': 'AML',
        'skills': ['NODE.JS', 'LARAVEL', 'REST API', 'JAVA', 'KOTLIN', 'C++'],
      },
      {
        'name': 'Alexis Rojas Dario', 
        'role': 'Desarrollador Database', 
        'stars': 5, 
        'description': 'Especialista en desarrollo y gestión de bases de datos',
        'image': 'assets/images/alexis.jpg',
        'initials': 'ARD',
        'skills': ['MONGODB', 'MYSQL', 'SQL SERVER', 'JSON', 'DOCKER', 'AZURE'],
      },
    ];

    final List<Map<String, dynamic>> topRow = team.sublist(0, 2);
    final List<Map<String, dynamic>> bottomRow = team.sublist(2, 4);

    return Column(
      children: [
        Row(
          children: topRow.map((member) {
            return Expanded(
              child: _buildTeamCard(member),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        Row(
          children: bottomRow.map((member) {
            return Expanded(
              child: _buildTeamCard(member),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTeamCard(Map<String, dynamic> member) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFD4A373).withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Foto cuadrada
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFD4A373).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFD4A373),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                member['image'],
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      member['initials'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4A373),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            member['name'],
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A373),
              fontFamily: 'Georgia',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFD4A373).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              member['role'],
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE8B86B),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            member['description'],
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFFF5E6D3),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return const Icon(
                Icons.star,
                size: 16,
                color: Color(0xFFE8B86B),
              );
            }),
          ),
          const SizedBox(height: 16),
          // Habilidades - solo etiquetas (círculos)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: (member['skills'] as List<String>).map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A373).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFD4A373).withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFE8B86B),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}