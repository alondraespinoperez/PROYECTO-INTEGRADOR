import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:the_rivera_barberia/providers/auth_provider.dart';
import 'package:the_rivera_barberia/ui/layouts/splash/splash_layout.dart';
import 'package:the_rivera_barberia/ui/views/login_view.dart';
import 'package:the_rivera_barberia/ui/views/register_view.dart';
import 'package:the_rivera_barberia/ui/views/dashboard_view.dart';
import 'package:the_rivera_barberia/ui/views/no_page_found_view.dart';
import 'package:the_rivera_barberia/ui/views/servicios_view.dart';
import 'package:the_rivera_barberia/ui/views/galeria_view.dart';
import 'package:the_rivera_barberia/ui/views/ubicacion_view.dart';
import 'package:the_rivera_barberia/ui/views/agenda_cita_view.dart';
import 'package:the_rivera_barberia/ui/views/nosotros_view.dart';
import 'package:the_rivera_barberia/ui/views/filosofia_view.dart';
import 'package:the_rivera_barberia/ui/views/membresia_view.dart';
import 'package:the_rivera_barberia/ui/views/equipo_view.dart';

// Definición de nombres de rutas
class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String servicios = '/servicios';
  static const String galeria = '/galeria';
  static const String ubicacion = '/ubicacion';
  static const String agendaCita = '/agenda-cita';
  static const String nosotros = '/nosotros';
  static const String filosofia = '/filosofia';
  static const String membresia = '/membresia';
  static const String equipo = '/equipo';
}

// Configuración del router
final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  redirect: (context, state) {
    // Obtener el authProvider usando context
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final isAuthenticated = authProvider.isAuthenticated;
    final isGoingToLogin = state.matchedLocation == Routes.login;
    final isGoingToRegister = state.matchedLocation == Routes.register;
    final isGoingToSplash = state.matchedLocation == Routes.splash;

    // Si no está autenticado y no va a login/register/splash, redirigir a login
    if (!isAuthenticated && 
        !isGoingToLogin && 
        !isGoingToRegister && 
        !isGoingToSplash) {
      return Routes.login;
    }

    // Si está autenticado y va a login/register/splash, redirigir a dashboard
    if (isAuthenticated && (isGoingToLogin || isGoingToRegister || isGoingToSplash)) {
      return Routes.dashboard;
    }

    return null;
  },
  routes: [
    // Ruta de splash (pantalla de bienvenida)
    GoRoute(
      path: Routes.splash,
      name: 'splash',
      builder: (context, state) => SplashLayout(
        child: const SplashScreen(),
      ),
    ),
    
    // Ruta de login
    GoRoute(
      path: Routes.login,
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),
    
    // Ruta de registro
    GoRoute(
      path: Routes.register,
      name: 'register',
      builder: (context, state) => const RegisterView(),
    ),
    
    // Dashboard principal (Inicio)
    GoRoute(
      path: Routes.dashboard,
      name: 'dashboard',
      builder: (context, state) => const DashboardView(),
    ),
    
    // Nosotros
    GoRoute(
      path: Routes.nosotros,
      name: 'nosotros',
      builder: (context, state) => const NosotrosView(),
    ),
    
    // Filosofía
    GoRoute(
      path: Routes.filosofia,
      name: 'filosofia',
      builder: (context, state) => const FilosofiaView(),
    ),
    
    // Equipo
    GoRoute(
      path: Routes.equipo,
      name: 'equipo',
      builder: (context, state) => const EquipoView(),
    ),
    
    // Servicios
    GoRoute(
      path: Routes.servicios,
      name: 'servicios',
      builder: (context, state) => const ServiciosView(),
    ),
    
    // Galería
    GoRoute(
      path: Routes.galeria,
      name: 'galeria',
      builder: (context, state) => GaleriaView(),
    ),
    
    // Ubicación
    GoRoute(
      path: Routes.ubicacion,
      name: 'ubicacion',
      builder: (context, state) => const UbicacionView(),
    ),
    
    // Agenda de cita
    GoRoute(
      path: Routes.agendaCita,
      name: 'agendaCita',
      builder: (context, state) => AgendaCitaView(),
    ),
    
    // Membresía
    GoRoute(
      path: Routes.membresia,
      name: 'membresia',
      builder: (context, state) => const MembresiaView(),
    ),
  ],
  errorBuilder: (context, state) => const NoPageFoundView(),
);

// Pantalla de Splash
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Esperar 2 segundos y luego redirigir
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.go(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.content_cut,
          size: 100,
          color: Colors.brown[300],
        ),
        const SizedBox(height: 20),
        const Text(
          'THE RIVERA',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Georgia',
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'CORTES MEN & GIRLS CARÁCTER',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white70,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 40),
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ],
    );
  }
}