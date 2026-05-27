import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  bool _isSideMenuOpen = false;
  int _selectedIndex = 0;

  bool get isSideMenuOpen => _isSideMenuOpen;
  int get selectedIndex => _selectedIndex;

  void openSideMenu() {
    _isSideMenuOpen = true;
    notifyListeners();
  }

  void closeSideMenu() {
    _isSideMenuOpen = false;
    notifyListeners();
  }

  void toggleSideMenu() {
    _isSideMenuOpen = !_isSideMenuOpen;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}