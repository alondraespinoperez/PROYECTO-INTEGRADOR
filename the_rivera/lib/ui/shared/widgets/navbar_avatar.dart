import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:the_rivera_barberia/providers/auth_provider.dart';
import 'package:the_rivera_barberia/router/router.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    // Obtener nombre del usuario del email (parte antes del @)
    String email = authProvider.userEmail ?? '';
    String userName = email.split('@')[0];
    if (userName.isEmpty) userName = 'Usuario';
    
    return PopupMenuButton<String>(
      offset: const Offset(0, 45),
      color: const Color(0xFF2C1810),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFD4A373),
            width: 2,
          ),
        ),
        child: CircleAvatar(
          backgroundColor: const Color(0xFFD4A373),
          radius: 18,
          child: Text(
            userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
            style: const TextStyle(
              color: Color(0xFF1A0D06),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          enabled: false,
          child: Row(
            children: [
              const Icon(Icons.person, size: 18, color: Color(0xFFD4A373)),
              const SizedBox(width: 12),
              Text(
                userName,
                style: const TextStyle(color: Color(0xFFF5E6D3)),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        const PopupMenuItem<String>(
          value: 'settings',
          child: Row(
            children: [
              Icon(Icons.settings, size: 18, color: Color(0xFFD4A373)),
              SizedBox(width: 12),
              Text('Configuración', style: TextStyle(color: Color(0xFFF5E6D3))),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'logout',
          child: Row(
            children: [
              Icon(Icons.logout, size: 18, color: Colors.redAccent),
              SizedBox(width: 12),
              Text('Cerrar Sesión', style: TextStyle(color: Color(0xFFF5E6D3))),
            ],
          ),
        ),
      ],
      onSelected: (String value) async {
        if (value == 'logout') {
          await authProvider.logout();
          if (context.mounted) {
            context.go(Routes.login);
          }
        } else if (value == 'settings') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Próximamente'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
    );
  }
}