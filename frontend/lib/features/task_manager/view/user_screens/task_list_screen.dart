import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class Task {
  final String title;
  final String deadline;
  final String description;

  Task({required this.title, required this.deadline, required this.description});
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // этот список создается данными из БД
  List<Task> tasks = [
    Task(
        title: 'Разработать планировщик задач',
        deadline: '20 октября',
        description: 'Нужно сделать в приложении меню'
            ' с выпадающими списками задач и их описанием'),
    Task(
        title: 'Реализация профиля',
        deadline: '15 октября',
        description: 'Сделать профиль пользователя с информацией о нем:'
            'имя, почта, телефон, описание'),
    Task(
        title: 'Анонимный чат',
        deadline: '17 октября',
        description: 'Сделать возможность пользователям анонимно обращаться'
            ' с жалобами или пожеданиями к начальству'),
    Task(
        title: 'Сервис устранения неполадок',
        deadline: '18 октября',
        description: 'Сделать возможным решение технических проблем дистанционно'
            'через приложение. Функционал: получение справок, больничных, отпусков;'
            'решение технических проблем, вызов специалиста'),
  ];

  List<bool> descriptionVisibleList = [];

  @override
  void initState() {
    super.initState();
    tasks.forEach((task) {
      descriptionVisibleList.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Задачи'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                descriptionVisibleList[index] = !descriptionVisibleList[index];
              });
            },
            child: Column(
              children: [
                ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].deadline),
                  trailing: Icon(
                    descriptionVisibleList[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
                if (descriptionVisibleList[index])
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(tasks[index].description),
                  ),
                const Divider(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const GeneralWidget(),
    );
  }
}