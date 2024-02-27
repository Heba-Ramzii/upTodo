import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:uptodo/core/cache_helper/cache_helper.dart';
import 'package:uptodo/cubit/delete_task/delete_task_cubit.dart';
import 'package:uptodo/cubit/task_cubit/add_task_cubit.dart';
import 'package:uptodo/repo/task_repo/task_repo_imp.dart';
import 'package:uptodo/routes.dart';
import 'package:uptodo/view/pages/intro/onboarding_screen.dart';
import 'package:uptodo/view/pages/intro/splash.dart';
import 'controller/task_controller.dart';
import 'core/constants/theme/theme.dart';
import 'core/firebase/firebase_options.dart';
import 'core/service/service_locator.dart';
import 'cubit/get_tasks_cubit/get_task_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await CacheHelper.init();
  setupForgotPassSingleton();
   runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>DeleteTaskCubit(getIt.get<TaskRepoImp>())),
        BlocProvider(create: (context)=>AddTaskCubit(getIt.get<TaskRepoImp>())),
        BlocProvider(create: (context)=>GetTasksCubit(getIt.get<TaskRepoImp>())),

       ],
      child: GetMaterialApp(
         theme: ThemeData(
            primaryColor: ThemeColors.primary,
           splashColor: Colors.transparent,
           highlightColor: null,
           hoverColor: Colors.transparent,
           fontFamily: "Lato",
          ),
        darkTheme: ThemeData(

          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          fontFamily: "Lato",
          scaffoldBackgroundColor: ThemeColors.darkBackground,
          appBarTheme: const AppBarTheme(
            color: ThemeColors.darkBackground,
            centerTitle: true
          )
          //brightness: Brightness.dark,
         ),
        themeMode: ThemeMode.dark,
         home: const SplashScreen(),
        routes: routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}





