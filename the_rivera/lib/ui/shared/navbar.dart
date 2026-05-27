import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_rivera_barberia/providers/sidemenu_provider.dart';
import 'package:the_rivera_barberia/ui/shared/widgets/navbar_avatar.dart';
import 'package:the_rivera_barberia/ui/shared/widgets/notification_indicator.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 900;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C1810),
            Color(0xFF1A0D06),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de menú móvil
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFFD4A373)),
              onPressed: () {
                context.read<SideMenuProvider>().toggleSideMenu();
              },
            ),
          
          // Título (solo escritorio)
          if (!isMobile)
            const Text(
              'THE RIVERA',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD4A373),
                fontFamily: 'Georgia',
                letterSpacing: 2,
              ),
            ),
          
          const Spacer(),
          
          // Campanita de notificaciones y avatar
          Row(
            children: [
              const NotificationIndicator(),
              const SizedBox(width: 16),
              const NavbarAvatar(),
            ],
          ),
        ],
      ),
    );
  }
}