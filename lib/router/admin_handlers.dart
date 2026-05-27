import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

// Este archivo maneja las rutas del administrador
// Aquí podemos agregar validaciones de roles en el futuro

class AdminHandler {
  static Widget adminLayout(Widget child) {
    // Por ahora usa el mismo layout del dashboard
    // En el futuro, aquí se puede validar si el usuario es admin
    return DashboardLayout(child: child);
  }
}

// Función para construir vistas de administrador
Widget buildAdminView(Widget view) {
  // Aquí se podría agregar una verificación de permisos
  return DashboardLayout(child: view);
}