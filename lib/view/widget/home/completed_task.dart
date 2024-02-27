import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';

import '../../../controller/task_controller.dart';

class CompletedTask extends StatefulWidget {
  const CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  Widget build(BuildContext context) {
     String dropdownValue = 'Completed';
    var items = [
      'Completed',
      'Today',
      'Yesterday',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            padding:const EdgeInsets.symmetric(horizontal: 16.0) ,
            decoration: BoxDecoration(
                color: ThemeColors.dark,
                borderRadius: BorderRadius.circular(6)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  dropdownColor: ThemeColors.dark,
                borderRadius: BorderRadius.circular(6),
                value: dropdownValue,
                 style:StyleManager.textStyleDark14,
                icon: const Row(
                   mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 10), // Adjust the width as needed
                    Icon(
                      IconlyLight.arrowDown2,
                      color: ThemeColors.fontColorDark,
                      size: 16,
                    ),
                  ],
                ),
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    print(newValue);
                  });
                },
              ),
            ),
          ),
        ),
        // ListView.separated(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: TaskController.tasks.lengt,
        //   separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16,),
        //   itemBuilder: (BuildContext context, int index) => Container(
        //     decoration: BoxDecoration(
        //       color: ThemeColors.dark,
        //       borderRadius: BorderRadius.circular(6),
        //     ),
        //     child:  Row(
        //       children: [
        //         Radio(
        //           value: 1,
        //           groupValue: 1,
        //           onChanged: (value) {
        //             setState(() {
        //             });
        //           },
        //         ),
        //         Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //              Text(
        //               TaskController.tasks[index].title.toString(),
        //               style: StyleManager.textStyleDark16,
        //             ),
        //             const SizedBox(height: 4,),
        //             Text(
        //                 TaskController.tasks[index].date.toString(),
        //               style: StyleManager.textStyleDark14.copyWith(
        //                   color: ThemeColors.gray
        //               ),),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
