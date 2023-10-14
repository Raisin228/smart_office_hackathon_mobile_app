import 'package:frontend/features/auth/view/auth_screen.dart';
import 'package:frontend/features/auth/view/sign_in_screen.dart';
import 'package:frontend/features/auth/view/sign_up_screen.dart';

import '../features/profile/view/profile_screen.dart';

final routes = {
  // профиль - корневой экран
  "/": (context) => ProfileScreen(),
  "/auth": (context) => const AuthScreen(),
  "/signin": (context) => const SignInScreen(),
  "/signup": (context) => const SignUpScreen(),
  // "/anonim_offer": (context) => ,
  // "/task_manager": (context) => ,
};
