import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = 
      GlobalKey<NavigatorState>();
  
  static BuildContext get context => navigatorKey.currentContext!;

  // Navegar a una ruta específica
  static void navigateTo(String routeName, {Object? extra}) {
    context.push(routeName, extra: extra);
  }

  // Reemplazar la ruta actual
  static void replaceTo(String routeName, {Object? extra}) {
    context.replace(routeName, extra: extra);
  }

  // Regresar a la pantalla anterior
  static void goBack() {
    context.pop();
  }

  // Navegar y eliminar todas las rutas anteriores
  static void navigateAndRemoveUntil(String routeName) {
    context.go(routeName);
  }
}