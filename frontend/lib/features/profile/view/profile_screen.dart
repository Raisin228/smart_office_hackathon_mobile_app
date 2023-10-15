import 'package:flutter/material.dart';
import '../../general_widgets/general_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String birthDay = "03.07.2004";
  final String workPlace = "Company";
  final String description = "Hello!";
  final String numPhone = "8(965) 725-71-50";
  final String position = 'manager';
  final String status = "В работе";



  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    List<String> name = [
      arguments["last_name"] ?? "Иванов",
      arguments["first_name"] ?? "Иван",
      arguments["patronymic"] ?? "Иванович"
    ];
    final email = arguments["email"] ?? "email";

    if(name.length != 3) {
      name =  ['Иванов', 'Иван', 'Иванович'];
    }

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
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(blurRadius: 30,
                        color: Colors.white,
                        spreadRadius: 10)],
                  ),
                  child:
                  CircleAvatar(
                    radius: getScreenSize(context).width * 0.19,
                    backgroundColor: Colors.white,
                    // backgroundImage: const AssetImage('assets/test_photo.png'),
                    child: Text(
                      name[1][0],
                      style: const TextStyle(color: Colors.lightGreenAccent,
                        fontSize: 100,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getScreenSize(context).height * 0.01),
              Center(
                child: Text(
                  '${name[0]} ${name[1]}\n ${name[2]}',
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
            ],
          ),
        ),
        bottomNavigationBar: const GeneralWidget(),
      );
    }
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