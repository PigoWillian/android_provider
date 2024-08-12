import 'package:flutter/material.dart';

class PalindromeProvider with ChangeNotifier {
  String _name = '';
  String _selectedUserName = '';

  String get name => _name;
  String get selectedUserName => _selectedUserName;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }
}
