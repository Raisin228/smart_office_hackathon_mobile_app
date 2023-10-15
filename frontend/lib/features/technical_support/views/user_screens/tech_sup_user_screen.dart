import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class TechSupUserScreen extends StatelessWidget {
  const TechSupUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Решение проблем'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Проблемы с ПО'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Обработка нажатия на элемент "Проблемы с ПО"
              Navigator.of(context).pushNamed("/problem",
                arguments: {
                  "problem": "Проблема с ПО",
                }
              );
            },
          ),
          ListTile(
            title: const Text('Проблемы с техникой'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Обработка нажатия на элемент "Проблемы с техникой"
              Navigator.of(context).pushNamed("/problem",
                  arguments: {
                    "problem": "Проблема с техникой",
                  }
              );
            },
          ),
          ListTile(
            title: const Text('Проблемы с мебелью'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Обработка нажатия на элемент "Проблемы с мебелью"
              Navigator.of(context).pushNamed("/problem",
                  arguments: {
                    "problem": "Проблема с мебелью",
                  }
              );
            },
          ),
          ListTile(
            title: const Text('Другое'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Обработка нажатия на элемент "Другое"
              Navigator.of(context).pushNamed("/other_problem");
            },
          ),
        ],
      ),
      bottomNavigationBar: const GeneralWidget(),
    );
  }
}