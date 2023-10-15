import 'package:flutter/material.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              // Обработчик нажатия на кнопку "Планировщик"
              Navigator.of(context).pushNamed("/task_manager_admin");
            },
          ),
          IconButton(
            icon: const Icon(Icons.error_outline),
            onPressed: () {
              // Обработчик нажатия на кнопку "Неполадки"
              // ДОБАВИТЬ ПРОВЕРКУ НА АДМИНА
              Navigator.of(context).pushNamed("/tech_sup_list");
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Обработчик нажатия на кнопку "Профиль"
              Navigator.of(context).pushNamed("/");
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Обработчик нажатия на кнопку "Чат"
              // ДОБАВИТЬ ОБРАБОТКУ РОЛИ ПОЛЬЗОВАТЕЛЯ
              Navigator.of(context).pushNamed("/anonim_offer_create");
            },
          ),
        ],
      ),
    );
  }
}
