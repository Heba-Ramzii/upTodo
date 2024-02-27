import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:uptodo/core/constants/widgets/custom_material_button.dart';

import '../../../core/constants/theme/style_manager.dart';
import '../../../core/constants/theme/theme.dart';
import '../../../core/constants/widgets/custom_text_form_field.dart';

class CreateNewCategory extends StatelessWidget {
  const CreateNewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = TextEditingController();

    return  Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create new category",
          style: StyleManager.textStyleDark16,
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Category name :",
            style: StyleManager.textStyleDark16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomTextFormField(
                controller: categoryController,
                type: TextInputType.text,
                label: "Category name"
            ),
          ),
          const Text(
            "Category icon :",
            style: StyleManager.textStyleDark16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomMaterialButton(
                text: "Choose icon from library",
                color: ThemeColors.dark,
                onPressed:  (){},
            ),
          ),
          const Text(
            "Category color :",
            style: StyleManager.textStyleDark16,
          ),

        ],
      ),
    );
  }
}
