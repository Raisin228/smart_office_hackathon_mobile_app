import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)
    ),
    // основной цвет фона
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,

    // цвет подчеркиваний
    dividerColor: Colors.grey,

    listTileTheme: const ListTileThemeData(iconColor: Colors.orange),
    // темы для текста
    textTheme: const TextTheme(
      // заголовки в баре
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
      // заголовки в теле
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: 20,

      ),
      // обычный текст
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),

    )

);