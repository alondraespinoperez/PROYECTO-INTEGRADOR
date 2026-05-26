import 'package:flutter/material.dart';
import 'package:the_rivera_barberia/services/local_storage.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userName;
  String? _userEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get userName => _userName;
  String? get userEmail => _userEmail;

  AuthProvider() {
    _checkAuthStatus();
  }

  // Verificar estado de autenticación al iniciar
  Future<void> _checkAuthStatus() async {
    _isAuthenticated = LocalStorage.isLoggedIn;
    _userName = LocalStorage.user;
    _userEmail = LocalStorage.email;
    notifyListeners();
  }

  // Login simulado
  Future<bool> login(String email, String password) async {
    // Simulación de validación
    // En una app real, aquí iría una petición HTTP
    
    await Future.delayed(const Duration(seconds: 1)); // Simular carga
    
    // Validación simple: cualquier email con @ y password mayor a 3 caracteres
    if (email.contains('@') && password.length >= 3) {
      _isAuthenticated = true;
      _userName = email.split('@')[0]; // Usar parte del email como nombre
      _userEmail = email;
      
      // Guardar en localStorage
      await LocalStorage.setToken('fake_token_12345');
      await LocalStorage.setUser(_userName!);
      await LocalStorage.setEmail(email);
      
      notifyListeners();
      return true;
    }
    
    return false;
  }

  // Registrar usuario simulado
  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simular carga
    
    if (name.isNotEmpty && email.contains('@') && password.length >= 3) {
      _isAuthenticated = true;
      _userName = name;
      _userEmail = email;
      
      await LocalStorage.setToken('fake_token_12345');
      await LocalStorage.setUser(name);
      await LocalStorage.setEmail(email);
      
      notifyListeners();
      return true;
    }
    
    return false;
  }

  // Cerrar sesión
  Future<void> logout() async {
    await LocalStorage.clearSession();
    _isAuthenticated = false;
    _userName = null;
    _userEmail = null;
    notifyListeners();
  }
}