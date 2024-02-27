import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:uptodo/controller/onboarding_controller.dart';

import '../../../core/constants/theme/theme.dart';
import '../../../core/data/static.dart';

class DotBuilder extends StatelessWidget {
  const DotBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: GetBuilder<OnBoardingControllerImp>(
        builder:(controller) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                      duration: const Duration(microseconds: 800),
                      width: 25,
                      height: 4,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: controller.currentPage == index
                            ? ThemeColors.primary :ThemeColors.secondary,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
