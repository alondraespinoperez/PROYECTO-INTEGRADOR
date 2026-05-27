import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  final int notificationCount;
  
  const NotificationIndicator({
    super.key,
    this.notificationCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Color(0xFFF5E6D3), // Beige claro
            size: 26,
          ),
          onPressed: () {
            _showNotificationsDialog(context);
          },
        ),
        if (notificationCount > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFFE8B86B), // Mostaza claro
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                notificationCount > 9 ? '9+' : '$notificationCount',
                style: const TextStyle(
                  color: Color(0xFF1A0D06), // Café oscuro para contraste
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  void _showNotificationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF5E6D3), // Fondo beige claro
          title: const Text(
            'Notificaciones',
            style: TextStyle(
              color: Color(0xFF5C3A1E), // Café claro
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 250,
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.notifications_active, color: Color(0xFFD4A373)),
                  title: Text(
                    '¡Bienvenido a THE RIVERA!',
                    style: TextStyle(
                      color: Color(0xFF5C3A1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Gracias por ser parte de nuestra comunidad',
                    style: TextStyle(color: Color(0xFF8B7355)),
                  ),
                ),
                Divider(color: Color(0xFFD4A373)),
                ListTile(
                  leading: Icon(Icons.local_offer, color: Color(0xFFD4A373)),
                  title: Text(
                    'Promoción especial',
                    style: TextStyle(
                      color: Color(0xFF5C3A1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '20% de descuento en tu primer corte',
                    style: TextStyle(color: Color(0xFF8B7355)),
                  ),
                ),
                Divider(color: Color(0xFFD4A373)),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Color(0xFFD4A373)),
                  title: Text(
                    'Recordatorio de cita',
                    style: TextStyle(
                      color: Color(0xFF5C3A1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Tienes una cita agendada para mañana',
                    style: TextStyle(color: Color(0xFF8B7355)),
                  ),
                ),
                Divider(color: Color(0xFFD4A373)),
                ListTile(
                  leading: Icon(Icons.celebration, color: Color(0xFFD4A373)),
                  title: Text(
                    '¡Nuevos estilos disponibles!',
                    style: TextStyle(
                      color: Color(0xFF5C3A1E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Conoce nuestra nueva colección de cortes',
                    style: TextStyle(color: Color(0xFF8B7355)),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cerrar',
                style: TextStyle(
                  color: Color(0xFFD4A373),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}