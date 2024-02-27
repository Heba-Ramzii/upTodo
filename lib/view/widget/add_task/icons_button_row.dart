import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/core/constants/widgets/custom_icon_button.dart';
import 'package:uptodo/core/function/show_choose%20_category.dart';
import 'package:uptodo/core/function/show_task_priority.dart';
import 'package:uptodo/generated/assets.dart';
import '../../../controller/task_controller.dart';
import '../../../core/constants/theme/theme.dart';
import '../../../core/function/select_date_time.dart';
import '../../../core/model/task_model.dart';
import '../../../cubit/task_cubit/add_task_cubit.dart';

class IconsButtonRow extends StatelessWidget {
   IconsButtonRow({super.key, required this.onPressed,});
  //final TaskController taskController = Get.find();
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomIconButton(
            onPressed:  () async {
      final dateTimePicker = DateTimePicker();
       final selectedDateTime = await dateTimePicker.selectDateAndTime(context);
      if (selectedDateTime != null) {
        AddTaskCubit.get(context).taskModel.date = selectedDateTime.toString();
         print("DateTime : $selectedDateTime"); // Or display it
      }
      },
            icon: Assets.imagesTimer
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: CustomIconButton(
              onPressed:  (){
                showChooseCategory(context);
              },
              icon: Assets.imagesTag
          ),
        ),
        CustomIconButton(
            onPressed:  (){
              showTaskPriorityDialog(context);
              },
            icon:Assets.imagesFlag
        ),
        const Spacer(),
        CustomIconButton(
            onPressed:  onPressed,
          iconColor: ThemeColors.primary,
          icon: Assets.imagesSend,
        ),

      ],
    );
  }
}
