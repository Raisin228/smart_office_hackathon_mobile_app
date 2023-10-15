import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  _ProblemScreenState createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  final TextEditingController _problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userName = ['Иванов', 'Иван', 'Иванович'];
    final problemData = (ModalRoute.of(context)?.settings.arguments ?? <String, String>{}) as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Заявка'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Заявитель: ${userName[0]} ${userName[1]} ${userName[2]}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              'Проблема: ${problemData["problem"]}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: TextField(
              controller: _problemController,
              decoration: const InputDecoration(
                labelText: 'Описание проблемы',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () {
                // описание проблемы
                String problem = _problemController.text;
                _problemController.clear();
              },
              child: const Text(
                'Отправить',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const GeneralWidget(),
    );
  }
}