import 'package:flutter/material.dart';
import 'package:frontend/theme/theme.dart';

import '../../general_widgets/general_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String firstName = "Адель";
  final String surName = "Смирнова";
  final String thirdName = "Александровна";
  final String email = "example@example.com";
  final String birthDay = "00.00.00";
  final String workPlace = "Company";
  final String description = "Hello!";
  final String numPhone = "88888888888";
  final String position = 'manager';
  final String status = "В работе";

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
        // height: getScreenSize(context).height,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getScreenSize(context).height * 0.01),
            Center(
              child: CircleAvatar(
                radius: getScreenSize(context).width * 0.19,
                backgroundImage: const AssetImage('assets/test_photo.png'),
              ),
            ),
            SizedBox(height: getScreenSize(context).height * 0.01),
            Center(
              child: Text(
                '$surName $firstName\n $thirdName',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Center(
              child: Text(
                position,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(height: getScreenSize(context).height * 0.01),
            const Divider(
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: getScreenSize(context).height*0.6,
              child:
                ListView(
                    children: <Widget>
                    [buildField("Телефон", numPhone, context),
                      buildField('Почта', email, context),
                      buildField('День рождения', birthDay, context),
                      buildField('Рабочее место', workPlace, context),
                      buildField('Хобби', description, context),
                      buildField("Статус", status, context),]
                ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child:
                GeneralWidget(),
            )

          ],
        ),
      ),
    );
  }

  Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  Widget buildField(String label, String value, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getScreenSize(context).height * 0.01,
          horizontal: getScreenSize(context).width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: getScreenSize(context).height * 0.01),
          Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium),
          const Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}