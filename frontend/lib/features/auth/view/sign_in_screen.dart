import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                // backgroundImage: const AssetImage('assets/test_photo.png'),
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
            const SizedBox(height: 24.0),
            TextButton(
              child: const Text('Отправить'),
              onPressed: () {
                final email = emailController.text;
                final password = passwordController.text;

                // здесь происходит проверка на правильность пароля/логина
                // если проверка пройдена успешно, то
                Navigator.of(context).pushNamed("/", arguments: {
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