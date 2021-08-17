import 'package:flutter/material.dart';
import 'package:lotuserp_comanda/main.dart';
import 'core/theme/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lotus ERP Comanda',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: LoginPage(),
    );
  }
}
