import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/shared/sidebar.dart';
import 'package:the_rivera_barberia/ui/shared/navbar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  
  const DashboardLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A0D06),
      body: Row(
        children: [
          const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const Navbar(),
                Expanded(
                  child: child, // El contenido ocupa todo el espacio disponible
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}