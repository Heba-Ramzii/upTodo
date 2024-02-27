import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';

import '../../view/widget/add_task/choose _category.dart';
import '../constants/widgets/custom_material_button.dart';

void showChooseCategory(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: ThemeColors.dark,
        title: const Center(
            child: Text(
          'Choose Category',
          style: StyleManager.textStyleDark16,
        )),
        content: const SizedBox(
             width: double.maxFinite,
         child: ChooseCategory()
        ),
        actions: [
          SizedBox(
              width: double.infinity,
              height: 48,
              child: CustomMaterialButton(text: "Add Category", onPressed:  (){},)),
        ],
      );
    },
  );
}
