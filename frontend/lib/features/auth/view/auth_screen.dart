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
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 30,
                      color: Colors.white,
                      spreadRadius: 10)],
                ),
                child:
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(40))
                ),
                child: Column(
                    children:<Widget> [
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
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 1,
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
                  ),
                )

              ],
            ),
          ),
        ),
    );
  }
}
