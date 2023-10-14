import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blue],
              begin: Alignment.center,
              end: Alignment.topCenter,
            ),
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text(
                  'Вход',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onPressed: () {
                // Обработка нажатия на кнопку "Вход"
                  Navigator.of(context).pushNamed("/signin");
                },
              ),
              TextButton(
                child: Text(
                  'Регистрация',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onPressed: () {
                  // Обработка нажатия на кнопку "Вход"
                  Navigator.of(context).pushNamed("/signup");
                },
              ),
            ],
    ),),)
    );
  }
}
