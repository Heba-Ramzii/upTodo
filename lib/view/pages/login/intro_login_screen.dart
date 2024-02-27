import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uptodo/core/constants/app_router.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/core/constants/widgets/custom_app_bar.dart';
import 'package:uptodo/core/constants/widgets/custom_material_button.dart';
import 'package:uptodo/core/constants/widgets/custom_outlined_button.dart';

class IntroLoginScreen extends StatelessWidget {
  const IntroLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
       body: Center(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 50),
           child: Column(
             children: [
              const Text(
                "Welcome to UpTodo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.fontColorDark
                ),
              ),
               const SizedBox(height: 24,),
               const Text(
                "Please login to your account or create\n new account to continue",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.fontColorDark
                ),
              ),
               const Spacer(),
               SizedBox(
                 width: double.infinity,
                 height: 50,
                 child: CustomMaterialButton(
                     text: 'LOGIN',
                     onPressed: (){
                       Get.to(AppRouter.kLogin);
                     },
                 ),
               ),
               const SizedBox(height: 28,),
               CustomOutlineButton(
                   text: "Create Account",
                   onPressed: (){}
               ),
              ],
                 ),
         ),
       ),
    );
  }
}
