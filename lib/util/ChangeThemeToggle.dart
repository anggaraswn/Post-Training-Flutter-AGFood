import 'package:agfood/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeToggle extends StatelessWidget {
  const ChangeThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
