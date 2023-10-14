import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class Problem {
  final String title;
  final String userName;
  final String description;

  Problem({required this.title, required this.userName, required this.description});
}

class TechSupAdminScreen extends StatefulWidget {
  const TechSupAdminScreen({super.key});

  @override
  _TechSupAdminScreenState createState() => _TechSupAdminScreenState();
}

class _TechSupAdminScreenState extends State<TechSupAdminScreen> {
  // этот список создается данными из БД
  List<Problem> problems = [
    Problem(
        title: 'Сломался компьютер',
        userName: 'Сальников Кирилл',
        description: 'Нужно сделать в приложении меню'
            ' с выпадающими списками задач и их описанием'),
    Problem(
        title: 'Реализация профиля',
        userName: '15 октября',
        description: 'Сделать профиль пользователя с информацией о нем:'
            'имя, почта, телефон, описание'),
    Problem(
        title: 'Анонимный чат',
        userName: '17 октября',
        description: 'Сделать возможность пользователям анонимно обращаться'
            ' с жалобами или пожеданиями к начальству'),
    Problem(
        title: 'Сервис устранения неполадок',
        userName: '18 октября',
        description: 'Сделать возможным решение технических проблем дистанционно'
            'через приложение. Функционал: получение справок, больничных, отпусков;'
            'решение технических проблем, вызов специалиста'),
  ];

  List<bool> descriptionVisibleList = [];

  @override
  void initState() {
    super.initState();
    problems.forEach((task) {
      descriptionVisibleList.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Заявки'),
      ),
      body: ListView.builder(
        itemCount: problems.length,
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
                  title: Text(problems[index].title),
                  subtitle: Text(problems[index].userName),
                  trailing: Icon(
                    descriptionVisibleList[index]
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                ),
                if (descriptionVisibleList[index])
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(problems[index].description),
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