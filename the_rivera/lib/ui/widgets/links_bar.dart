import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_rivera_barberia/router/router.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 600;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFFF5E6D3),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: isMobile ? 12 : 24,
        runSpacing: 8,
        children: [
          _buildLink(context, 'NOSOTROS', Routes.nosotros),
          _buildLink(context, 'SERVICIOS', Routes.servicios),
          _buildLink(context, 'GALERÍA', Routes.galeria),
          _buildLink(context, 'UBICACIÓN', Routes.ubicacion),
          _buildLink(context, 'REGISTRO', Routes.register),
          _buildLink(context, 'AGENDAR CITA', Routes.agendaCita),
          _buildLink(context, 'ES', null),
          _buildLink(context, 'ECOWEB', null),
          _buildLink(context, 'LOGIN', Routes.login),
        ],
      ),
    );
  }

  Widget _buildLink(BuildContext context, String title, String? route) {
    return InkWell(
      onTap: () {
        if (route != null) {
          if (route == Routes.register || route == Routes.login) {
            context.push(route);
          } else {
            context.push(route);
          }
        }
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: route != null ? const Color(0xFF8B5A2B) : const Color(0xFF8B7355),
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}