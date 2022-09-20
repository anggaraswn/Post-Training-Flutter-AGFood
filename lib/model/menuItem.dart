import 'package:agfood/util/ChangeThemeToggle.dart';
import 'package:flutter/material.dart';

class MyMenuItem {
  final String text;
  final IconData icon;
  final ChangeThemeToggle themeToggle;

  const MyMenuItem(
      {required this.text, required this.icon, required this.themeToggle});
}
