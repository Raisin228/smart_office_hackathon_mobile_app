import 'package:flutter/material.dart';
import 'package:frontend/router/router.dart';
import 'package:frontend/theme/theme.dart';

class OfficeBoostApp extends StatelessWidget {
  const OfficeBoostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Office Boost mobile',
      // тема для всего приложения
      theme: darkTheme,

      // маршруты (пока не генерируются)
      routes: routes,
      initialRoute: "/auth",
    );
  }
}