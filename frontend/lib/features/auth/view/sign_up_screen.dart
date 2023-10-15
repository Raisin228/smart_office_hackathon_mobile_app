import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue],
            begin: Alignment.center,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
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

            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Почта',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Пароль',
              ),
              obscureText: true,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Имя полностью',
              ),
            ),

            const SizedBox(height: 24.0),
            TextButton(
              child: const Text('Отправить'),
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;
                final userName = nameController.text.split(" ");

                // информация для запросов
                final signUpData = {
                  "email": email,
                  "password": password,
                  "first_name": userName[1],
                  "last_name": userName[0],
                  "patronymic": userName[2]
                };
                Navigator.of(context).pushNamed("/", arguments: signUpData);
                // здесь происходит проверка на правильность пароля/логина
                // если проверка пройдена успешно, то

              },
            ),
          ],
        ),
      ),
    );
  }
}