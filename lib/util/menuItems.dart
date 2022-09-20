import 'package:agfood/model/menuItem.dart';
import 'package:flutter/material.dart';

import 'ChangeThemeToggle.dart';

class MenuItems {
  static const List<MyMenuItem> itemList = [itemThemeToggle];

  static const itemThemeToggle = MyMenuItem(
      text: 'Change Theme',
      icon: Icons.format_color_fill_rounded,
      themeToggle: ChangeThemeToggle());
}
