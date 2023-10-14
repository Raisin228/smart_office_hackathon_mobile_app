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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;
                final userName = nameController.text.split(" ");

                // здесь происходит проверка на правильность пароля/логина
                // если проверка пройдена успешно, то
                Navigator.of(context).pushNamed("/", arguments: {
                  "name": userName,
                  "email": email
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}