import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_rivera_barberia/router/router.dart';
import 'package:the_rivera_barberia/services/local_storage.dart';
import 'package:the_rivera_barberia/providers/auth_provider.dart';
import 'package:the_rivera_barberia/providers/sidemenu_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar almacenamiento local
  await LocalStorage.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => SideMenuProvider()),
      ],
      child: MaterialApp.router(
        title: 'The Rivera Barbería',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color(0xFF8B5A2B),
          hintColor: const Color(0xFFD4A373),
          scaffoldBackgroundColor: const Color(0xFFFDF8F0),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(0xFF8B5A2B)),
            titleTextStyle: TextStyle(
              color: Color(0xFF8B5A2B),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Georgia',
            ),
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontFamily: 'Georgia', color: Color(0xFF5C3A1E)),
            titleLarge: TextStyle(fontFamily: 'Georgia', fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontFamily: 'Arial'),
          ),
        ),
        routerConfig: router,
      ),
    );
  }
}