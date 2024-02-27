import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo/core/cache_helper/cache_data.dart';
import 'package:uptodo/core/cache_helper/cache_helper.dart';
import 'package:uptodo/core/cache_helper/cache_helper_keys.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/core/model/auth_service_model.dart';
import 'package:uptodo/generated/assets.dart';
import 'package:uptodo/view/pages/login/login_screen.dart';
import '../../../cubit/get_tasks_cubit/get_task_cubit.dart';
import '../home/home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkFirstRun();
  }

  void checkFirstRun() async {

    CacheData.isFirstRun = await CacheHelper.getData(key: CacheHelperKeys.isFirstRun);
    CacheData.id = await CacheHelper.getData(key: CacheHelperKeys.id);
    if (CacheData.isFirstRun == null ) {
      CacheData.isFirstRun = true;
       await CacheHelper.saveData(key: CacheHelperKeys.isFirstRun, value:  true);
    }
    if(CacheData.id!=null)
    {
      await AuthService.getUserByID();
      await GetTasksCubit.get(context).getTasks();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:AnimatedSplashScreen(
       animationDuration: const Duration(milliseconds: 2500),
       centered: true,
       backgroundColor: Colors.transparent,
       splash:  Column(
          children: [
           SvgPicture.asset(
             Assets.imagesLogo,
            ),
           const SizedBox(height: 20,),
           const Text(
               'UpTodo',
             style: TextStyle(
               fontSize: 40,
               color: ThemeColors.fontColorDark
             ),
           )
         ],
       ) ,
       splashIconSize: 200,
       nextScreen:  CacheData.isFirstRun==null? const OnBoardingScreen() : CacheData.id==null? const LoginScreen():const HomeScreen(),
       splashTransition: SplashTransition.fadeTransition,
       duration: 2500,
              ) ,
    );
  }
}
