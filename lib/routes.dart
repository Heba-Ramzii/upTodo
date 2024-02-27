import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/app_router.dart';
import 'package:uptodo/view/pages/home/home_screen.dart';
import 'package:uptodo/view/pages/login/intro_login_screen.dart';
import 'package:uptodo/view/pages/login/login_screen.dart';
import 'package:uptodo/view/pages/register/register_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
 AppRouter.kIntroLogin : (context) => const IntroLoginScreen(),
 AppRouter.kLogin : (context) => const LoginScreen(),
 AppRouter.kRegister : (context) => const RegisterScreen(),
 AppRouter.kHomeView : (context) => const HomeScreen(),
};