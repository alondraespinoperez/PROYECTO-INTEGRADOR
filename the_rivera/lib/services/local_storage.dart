import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Guardar sesión
  static Future<void> setToken(String token) async {
    await _prefs.setString('token', token);
  }

  static String? get token => _prefs.getString('token');

  // Guardar usuario
  static Future<void> setUser(String userName) async {
    await _prefs.setString('user_name', userName);
  }

  static String? get user => _prefs.getString('user_name');

  // Guardar email
  static Future<void> setEmail(String email) async {
    await _prefs.setString('user_email', email);
  }

  static String? get email => _prefs.getString('user_email');

  // Verificar si está logueado
  static bool get isLoggedIn => token != null && token!.isNotEmpty;

  // Cerrar sesión
  static Future<void> clearSession() async {
    await _prefs.remove('token');
    await _prefs.remove('user_name');
    await _prefs.remove('user_email');
  }
}