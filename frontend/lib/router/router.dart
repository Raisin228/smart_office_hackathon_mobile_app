import 'package:frontend/features/anonim_offer/view/user_screens/send_offer_screen.dart';
import 'package:frontend/features/auth/view/auth_screen.dart';
import 'package:frontend/features/auth/view/sign_in_screen.dart';
import 'package:frontend/features/auth/view/sign_up_screen.dart';

import '../features/anonim_offer/view/admin_screens/view_offers_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../features/task_manager/view/admin_screens/create_task_screen.dart';
import '../features/task_manager/view/admin_screens/task_list_screen.dart';
import '../features/task_manager/view/user_screens/task_list_screen.dart';
import '../features/technical_support/views/admin_screens/tech_sup_admin_screen.dart';
import '../features/technical_support/views/user_screens/other_problem_screen.dart';
import '../features/technical_support/views/user_screens/problem_screen.dart';
import '../features/technical_support/views/user_screens/tech_sup_user_screen.dart';

final routes = {
  // профиль - корневой экран ВРЕМЕННО
  // основные экраны
  "/": (context) => const ProfileScreen(),
  "/auth": (context) => const AuthScreen(),

  // экраны авторизации
  "/signin": (context) => const SignInScreen(),
  "/signup": (context) => const SignUpScreen(),

  // экраны для анонимных обращений
  "/anonim_offer_admin": (context) => const ViewOffersScreen(),
  "/anonim_offer_create": (context) => const SendOfferScreen(),

  // экраны для распределения задач
  "/task_manager": (context) => const TaskListScreen(),
  "/task_manager_admin": (context) => const TaskListAdminScreen(),
  "/create_task": (context) => const CreateTaskScreen(),

  // экраны для меню решения проблем
  "/tech_sup_list": (context) => const TechSupUserScreen(),
  "/tech_sup_list_admin": (context) => const TechSupAdminScreen(),
  "/problem": (context) => const ProblemScreen(),
  "/other_problem": (context) => const OtherProblemScreen(),
};
