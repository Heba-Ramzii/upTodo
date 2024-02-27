import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/widgets/custom_text_button.dart';
import 'package:uptodo/core/constants/widgets/custom_text_form_field.dart';
import 'package:uptodo/view/pages/login/login_screen.dart';

import '../../../core/constants/widgets/custom_app_bar.dart';
import '../../../core/constants/widgets/custom_material_button.dart';
import '../../../core/constants/widgets/custom_outlined_button.dart';
import '../../../core/model/auth_service_model.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

     return  Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding:  StyleManager.pagePadding.copyWith(
          top: 0,
          bottom: 20,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Register",
                style: StyleManager.titleStyle32,
              ),
              const SizedBox(height: 20,),
              const Text(
                "Username",
                style: StyleManager.textStyleDark16,
              ),
              CustomTextFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: "Enter your Username"
              ),
              const SizedBox(height: 10,),
              const Text(
                "Password",
                style: StyleManager.textStyleDark16,
              ),
              CustomTextFormField(
                isPassword: true,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  label: "Enter Password"
              ),
              const SizedBox(height: 10,),
              const Text(
                "Confirm Password",
                style: StyleManager.textStyleDark16,
              ),
              CustomTextFormField(
                  controller: confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  label: "Confirm Password"
              ),
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomMaterialButton(
                  text: 'Register',
                  onPressed: (){
                    print("Register+++++++++++++++++++++++++++++");
                    AuthService.registerUser(
                        emailController.text,
                        passwordController.text,
                    );
                    Get.to(const LoginScreen());
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xff979797),
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "or",
                      style: StyleManager.textStyleDark16,
                      textAlign: TextAlign.center,
                    ),
                    Expanded(
                      child: Divider(
                        color: Color(0xff979797),
                        indent: 5,
                      ),
                    ),

                  ],),
              ),
              CustomOutlineButton(
                  isIcon: true,
                  icon:FontAwesomeIcons.google,
                  text: "Register with Google",
                  onPressed: (){
                  }
              ),
              const SizedBox(height: 20,),
              CustomOutlineButton(
                  isIcon: true,
                  icon:Icons.apple_rounded,
                  text: "Register with Apple",
                  onPressed: (){}
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ? ",
                    style: StyleManager.textStyleDark16,
                  ),
                  CustomTextButton(text: "Login", onPressed:  (){
                    Get.to(const LoginScreen());
                  }
                  ),
                ],
              )

            ]),
      ),
    );
  }
}
