import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.orange,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)
    ),
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
    dividerColor: Colors.grey,
    listTileTheme: const ListTileThemeData(iconColor: Colors.orange),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 25,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 20,

      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),

    )

);