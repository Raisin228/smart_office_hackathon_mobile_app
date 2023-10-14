import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class OtherProblemScreen extends StatefulWidget {
  const OtherProblemScreen({super.key});

  @override
  _OtherProblemScreenState createState() => _OtherProblemScreenState();
}

class _OtherProblemScreenState extends State<OtherProblemScreen> {
  final TextEditingController _problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userName = ['Иванов', 'Иван', 'Иванович'];

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