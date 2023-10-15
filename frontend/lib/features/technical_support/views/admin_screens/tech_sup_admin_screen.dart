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
        title: 'Лампочка перегорела',
        userName: 'Атрошенко Богдан',
        description: 'Над рабочим местом перегорела лампочка, требуется мастер'),
    Problem(
        title: 'Рабочее кресло',
        userName: 'Скороходов Дмитрий',
        description: 'Рабочее кресло перестало держать заданную высоту,'
            'требуется замена'),
    Problem(
        title: 'Не удобно пользоваться офисом!',
        userName: 'команда Synthex',
        description: 'Офис стал не удобным, срочно требуется новое и '
            'удобное приложение для связи сотрудников между собой и'
            ' с начальством, для создания комфортных рабочих условий и'
            'просто для Вас!'),
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