import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/widgets/custom_text_button.dart';
import 'package:uptodo/core/constants/widgets/custom_text_form_field.dart';
import 'package:uptodo/cubit/get_tasks_cubit/get_task_cubit.dart';
import 'package:uptodo/view/pages/home/home_screen.dart';
import 'package:uptodo/view/pages/register/register_screen.dart';
import '../../../core/constants/toaster.dart';
import '../../../core/constants/widgets/custom_app_bar.dart';
import '../../../core/constants/widgets/custom_material_button.dart';
import '../../../core/constants/widgets/custom_outlined_button.dart';
import '../../../core/model/auth_service_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return  Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding:  StyleManager.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Login",
              style: StyleManager.titleStyle32,
              ),
              const SizedBox(height: 40,),
              const Text(
                  "Username",
              style: StyleManager.textStyleDark16,
              ),
              CustomTextFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: "Enter your Username",
                onChange: (email) {
                  this.email = email;
                },

              ),
              const SizedBox(height: 25,),
              const Text(
                  "Password",
                style: StyleManager.textStyleDark16,
              ),
              CustomTextFormField(
                  isPassword: true,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  label: "Enter Password",
                onChange: (password) {
                   this.password = password;
                },
              ),
              const SizedBox(height: 45,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomMaterialButton(
                  text: 'LOGIN',
                  onPressed: () async {
                    print("onPressed+++");
                    if (email == null || email!.isEmpty || password == null || password!.isEmpty) {
                      print("if+++++++++");
                      Toaster.showError(text: "Enter user or password");
                    } else {
                      print("else+++++++++");
                      bool userExists =await AuthService.loginUser(
                        emailController.text,
                        passwordController.text,
                      );
                          if (userExists) {
                            Toaster.showSuccess(text: "Login Successful");
                            GetTasksCubit.get(context).getTasks();
                             return Get.off(() => const HomeScreen());
                           } else {
                            Toaster.showError(text: "Invalid email or password");
                            print('Invalid email or password');
                          }
                    }
                  },
                ),

              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
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
                  text: "Login with Google",
                  onPressed: (){}
              ),
              const SizedBox(height: 20,),
              CustomOutlineButton(
                  isIcon: true,
                  icon:Icons.apple_rounded,
                  text: "Login with Apple",
                  onPressed: (){

                  }
              ),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Don’t have an account ? ",
                    style: StyleManager.textStyleDark16,
                  ),
                  CustomTextButton(text: "Register", onPressed:  (){
                    Get.to(const RegisterScreen());
                  }
                  ),
                ],
              )

        ]),
      ),
    );
  }
}
