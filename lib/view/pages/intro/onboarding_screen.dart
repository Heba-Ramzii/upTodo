import 'package:flutter/material.dart';
 import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:uptodo/controller/onboarding_controller.dart';
 import 'package:uptodo/core/constants/widgets/custom_material_button.dart';
import 'package:uptodo/core/constants/widgets/custom_text_button.dart';
import 'package:uptodo/view/widget/onboarding/slider_builder.dart';



class OnBoardingScreen extends GetView<OnBoardingControllerImp> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 14),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextButton(text: 'Skip', onPressed: () {
                controller.skip();
              },),
              const SizedBox(height: 2,),
              const Expanded(
                flex: 3,
                child:SliderBuilder() ,
              ),
              Expanded(
                 child: Row(
                 children: [
                   CustomTextButton(text: 'Back', onPressed: () {
                     controller.back();

                   },),
                   const Spacer(),
                   CustomMaterialButton(text: 'Next',
                     onPressed: () {
                      controller.next();
                     },
                   ),
                 ],
                 ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
