import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uptodo/controller/onboarding_controller.dart';

import '../../../core/constants/theme/theme.dart';
import '../../../core/constants/widgets/custom_title_text.dart';
import '../../../core/data/static.dart';
import 'dot_builder_onboarding.dart';

class SliderBuilder extends GetView<OnBoardingControllerImp> {
  const SliderBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:controller.pageController ,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount:onBoardingList.length,
        itemBuilder: (context , i) => Column(
          children: [
            SvgPicture.asset(
              onBoardingList[i].image!,
              height: 278,
              width: 214,
            ),
            const DotBuilder(),
            Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: CustomTitleText(text: onBoardingList[i].title!)
            ),
            Text(
              onBoardingList[i].description!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: ThemeColors.fontColorDark,
                  fontSize: 16,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        )
    );
  }
}
