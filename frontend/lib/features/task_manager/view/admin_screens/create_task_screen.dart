import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  List<String> arr = [];

  void _createTask() {
    String employeeName = _employeeNameController.text;
    String taskName = _taskNameController.text;
    String taskDescription = _taskDescriptionController.text;
    String deadline = _deadlineController.text;
    String taskData = '$employeeName, $taskName, $taskDescription, $deadline';
    setState(() {
      arr.add(taskData);
    });

    _employeeNameController.clear();
    _taskNameController.clear();
    _taskDescriptionController.clear();
    _deadlineController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание задачи'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _employeeNameController,
              decoration: const InputDecoration(
                labelText: 'Кому назначить задачу',
              ),
            ),
            TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(
                labelText: 'Название задачи',
              ),
            ),
            TextField(
              controller: _taskDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Описание задачи',
              ),
            ),
            TextField(
              controller: _deadlineController,
              decoration: const InputDecoration(
                labelText: 'Дедлайн',
              ),
            ),
            const SizedBox(height: 16.0),
            Center(child:
                TextButton(
                  onPressed: _createTask,
                  child: Text('Создать',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              )

          ],
        ),
      ),
      bottomNavigationBar: const GeneralWidget(),
    );
  }
}