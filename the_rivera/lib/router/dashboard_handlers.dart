import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/ui/layouts/dashboard/dashboard_layout.dart';

// Este archivo maneja las rutas del dashboard
// Por ahora es simple, pero podemos expandirlo según necesidades

class DashboardHandler {
  static Widget dashboardLayout(Widget child) {
    return DashboardLayout(child: child);
  }
}

// Función para construir las vistas del dashboard
Widget buildDashboardView(Widget view) {
  return DashboardLayout(child: view);
}