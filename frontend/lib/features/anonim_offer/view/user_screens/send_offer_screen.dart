import 'package:flutter/material.dart';
import 'package:frontend/features/general_widgets/general_widgets.dart';

class SendOfferScreen extends StatefulWidget {
  const SendOfferScreen({super.key});

  @override
  _SendOfferScreenState createState() => _SendOfferScreenState();
}

class _SendOfferScreenState extends State<SendOfferScreen> {
  final TextEditingController _offerNameController = TextEditingController();
  final TextEditingController _offerDescriptionController = TextEditingController();

  void _createOffer() {
    // переменные для БД
    String offerName = _offerNameController.text;
    String offerDescription = _offerDescriptionController.text;

    _offerNameController.clear();
    _offerDescriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание предложения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _offerNameController,
              decoration: const InputDecoration(
                labelText: 'Название предложения',
              ),
            ),
            TextField(
              controller: _offerDescriptionController,
              decoration: const InputDecoration(
                labelText: 'Описание предложения',
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: _createOffer,
              child: const Text('Отправить'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const GeneralWidget(),
    );
  }
}