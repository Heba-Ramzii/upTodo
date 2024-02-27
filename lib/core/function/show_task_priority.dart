import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/view/widget/add_task/task_priority.dart';

import '../constants/widgets/custom_material_button.dart';
import '../constants/widgets/custom_text_button.dart';

void showTaskPriorityDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: ThemeColors.dark,
        title: const Center(child: Text(
          'Task Priority',
          style: StyleManager.textStyleDark16,
        )),
        content: const SizedBox(
             width: double.maxFinite,
         child: TaskPriority()),
        actions: [
          CustomTextButton(text: "Cancel", onPressed:  (){
            Navigator.pop(context);
          }),
          const SizedBox(width: 15,),
          CustomMaterialButton(text: "Save", onPressed:  (){},),
        ],
      );
    },
  );
}
