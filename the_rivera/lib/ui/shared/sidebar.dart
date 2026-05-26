import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:the_rivera_barberia/providers/sidemenu_provider.dart';
import 'package:the_rivera_barberia/providers/auth_provider.dart';
import 'package:the_rivera_barberia/router/router.dart';
import 'package:the_rivera_barberia/ui/shared/widgets/logo.dart';
import 'package:the_rivera_barberia/ui/shared/widgets/menu_item.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width <= 900;
    
    return Container(
      width: isMobile ? width * 0.75 : 260,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2C1810),
            Color(0xFF1A0D06),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo
          Container(
            padding: const EdgeInsets.all(24),
            child: const Logo(showText: true),
          ),
          
          Container(
            height: 1,
            color: const Color(0xFF5C3A1E),
          ),
          
          // Menú de navegación
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                // Sección principal
                MenuItem(
                  icon: Icons.home,
                  title: 'Inicio',
                  isSelected: sideMenuProvider.selectedIndex == 0,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(0);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.dashboard);
                  },
                ),
                MenuItem(
                  icon: Icons.info,
                  title: 'Nosotros',
                  isSelected: sideMenuProvider.selectedIndex == 1,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(1);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.nosotros);
                  },
                ),
                MenuItem(
                  icon: Icons.lightbulb,
                  title: 'Filosofía',
                  isSelected: sideMenuProvider.selectedIndex == 2,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(2);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.filosofia);
                  },
                ),
                MenuItem(
                  icon: Icons.group,
                  title: 'Equipo',
                  isSelected: sideMenuProvider.selectedIndex == 3,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(3);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.equipo);
                  },
                ),
                
                const Divider(
                  color: Color(0xFF5C3A1E),
                  thickness: 1,
                  height: 30,
                ),
                
                // Sección de servicios
                MenuItem(
                  icon: Icons.cut,
                  title: 'Servicios',
                  isSelected: sideMenuProvider.selectedIndex == 4,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(4);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.servicios);
                  },
                ),
                MenuItem(
                  icon: Icons.photo_library,
                  title: 'Galería',
                  isSelected: sideMenuProvider.selectedIndex == 5,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(5);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.galeria);
                  },
                ),
                MenuItem(
                  icon: Icons.location_on,
                  title: 'Ubicación',
                  isSelected: sideMenuProvider.selectedIndex == 6,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(6);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.ubicacion);
                  },
                ),
                MenuItem(
                  icon: Icons.calendar_today,
                  title: 'Agendar Cita',
                  isSelected: sideMenuProvider.selectedIndex == 7,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(7);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.agendaCita);
                  },
                ),
                MenuItem(
                  icon: Icons.star,
                  title: 'Membresía',
                  isSelected: sideMenuProvider.selectedIndex == 8,
                  onTap: () {
                    sideMenuProvider.setSelectedIndex(8);
                    if (isMobile) sideMenuProvider.closeSideMenu();
                    context.go(Routes.membresia);
                  },
                ),
              ],
            ),
          ),
          
          Container(
            height: 1,
            color: const Color(0xFF5C3A1E),
          ),
          
          // Cerrar sesión
          Padding(
            padding: const EdgeInsets.all(16),
            child: MenuItem(
              icon: Icons.logout,
              title: 'Cerrar Sesión',
              isSelected: false,
              onTap: () async {
                await context.read<AuthProvider>().logout();
                if (isMobile) sideMenuProvider.closeSideMenu();
                if (context.mounted) {
                  context.go(Routes.login);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}