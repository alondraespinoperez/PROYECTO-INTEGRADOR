import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class UbicacionView extends StatelessWidget {
  const UbicacionView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 800;
    
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
                  'NUESTRA UBICACIÓN',
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
                  width: 385,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            // Información de ubicación y mapa
            isMobile
                ? Column(
                    children: [
                      _buildLocationInfo(),
                      const SizedBox(height: 30),
                      _buildMap(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildLocationInfo()),
                      const SizedBox(width: 30),
                      Expanded(child: _buildMap()),
                    ],
                  ),
            
            const SizedBox(height: 50),
            
            // Horarios
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'HORARIOS DE ATENCIÓN',
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
                  width: 355,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildSchedule(),
            
            const SizedBox(height: 50),
            
            // Puntos de interés cercanos
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'LUGARES DE INTERÉS CERCANOS',
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
                  width: 479,
                  height: 2,
                  color: const Color(0xFFE8B86B),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildNearbyPlaces(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Container(
      padding: const EdgeInsets.all(24),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.location_on, color: Color(0xFFD4A373), size: 28),
              SizedBox(width: 12),
              Text(
                'THERIVERA Barbería',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4A373),
                  fontFamily: 'Georgia',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF5C3A1E)),
          const SizedBox(height: 20),
          _buildContactItem(Icons.location_on, 'Valentín Gómez Farias #14\nCentro, 61250\nMaravatío, Michoacán, Mexico'),
          const SizedBox(height: 16),
          _buildContactItem(Icons.phone, '+52 447 111 0784'),
          const SizedBox(height: 16),
          _buildContactItem(Icons.email, 'teteriv_17@hotmail.com'),
          const SizedBox(height: 16),
          _buildContactItem(Icons.access_time, 'Lun - Vie: 9:00 AM - 7:00 PM Sab: 9:00 AM - 3:00 PM'),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _launchMaps(),
            icon: const Icon(Icons.directions),
            label: const Text('CÓMO LLEGAR'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFD4A373),
              foregroundColor: const Color(0xFF1A0D06),
              minimumSize: const Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFD4A373), size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFF5E6D3),
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMap() {
    return Container(
      height: 400,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Mapa interactivo de Google Maps embebido
            IgnorePointer(
              ignoring: false,
              child: SizedBox.expand(
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Image.network(
                    'https://maps.googleapis.com/maps/api/staticmap?center=19.8931,-100.4444&zoom=15&size=600x400&markers=color:0xD4A373%7C19.8931,-100.4444&key=YOUR_API_KEY',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF2C1810),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.map, size: 60, color: Color(0xFFD4A373)),
                              SizedBox(height: 16),
                              Text(
                                'Cargando mapa...',
                                style: TextStyle(color: Color(0xFFD4A373)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Botón para abrir en Google Maps
            Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: () => _launchMaps(),
                backgroundColor: const Color(0xFFD4A373),
                child: const Icon(Icons.open_in_new, color: Color(0xFF1A0D06)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSchedule() {
    final schedule = [
      {'day': 'Lunes', 'hours': '9:00 AM - 7:00 PM'},
      {'day': 'Martes', 'hours': '9:00 AM - 7:00 PM'},
      {'day': 'Miércoles', 'hours': '9:00 AM - 7:00 PM'},
      {'day': 'Jueves', 'hours': '9:00 AM - 7:00 PM'},
      {'day': 'Viernes', 'hours': '9:00 AM - 7:00 PM'},
      {'day': 'Sábado', 'hours': '9:00 AM - 3:00 PM'},  // Cambiado a 3:00 PM
      {'day': 'Domingo', 'hours': 'Cerrado'},
    ];

    return Container(
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
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: const Color(0xFF5C3A1E)),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
        },
        children: schedule.map((item) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  item['day']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A373),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  item['hours']!,
                  style: TextStyle(
                    fontSize: 16,
                    color: item['hours'] == 'Cerrado' ? Colors.redAccent : const Color(0xFFF5E6D3),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNearbyPlaces() {
    final List<Map<String, dynamic>> places = [
      {'name': 'Auditorio Municipal', 'icon': Icons.audiotrack, 'distance': '500m'},
      {'name': 'Bar Chelona', 'icon': Icons.local_bar, 'distance': '300m'},
      {'name': 'Jardín Melchor Ocampo', 'icon': Icons.park, 'distance': '400m'},
      {'name': 'Teatro Morelos', 'icon': Icons.theaters, 'distance': '600m'},
      {'name': 'Central de autobuses', 'icon': Icons.bus_alert, 'distance': '800m'},
      {'name': 'Mi Bodega', 'icon': Icons.store, 'distance': '200m'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: places.length,
      itemBuilder: (context, index) {
        final place = places[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2C1810), Color(0xFF1A0D06)],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD4A373).withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(place['icon'] as IconData, color: const Color(0xFFD4A373), size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      place['name'],
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD4A373),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      place['distance'],
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFFF5E6D3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchMaps() async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=19.8931,-100.4444',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir el mapa';
    }
  }
}