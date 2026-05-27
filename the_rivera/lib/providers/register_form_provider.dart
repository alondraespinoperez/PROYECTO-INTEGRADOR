import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;

  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  bool get acceptTerms => _acceptTerms;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void toggleObscurePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleObscureConfirmPassword() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  void toggleAcceptTerms() {
    _acceptTerms = !_acceptTerms;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void updateName(String value) {
    name = value;
  }

  void updateEmail(String value) {
    email = value;
  }

  void updatePhone(String value) {
    phone = value;
  }

  void updatePassword(String value) {
    password = value;
  }

  void updateConfirmPassword(String value) {
    confirmPassword = value;
  }

  void resetForm() {
    name = '';
    email = '';
    phone = '';
    password = '';
    confirmPassword = '';
    _isLoading = false;
    _obscurePassword = true;
    _obscureConfirmPassword = true;
    _acceptTerms = false;
    formKey = GlobalKey<FormState>();
    notifyListeners();
  }
}