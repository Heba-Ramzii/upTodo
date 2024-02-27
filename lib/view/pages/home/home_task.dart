import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import 'package:uptodo/core/constants/widgets/custom_text_form_field.dart';
import 'package:uptodo/view/widget/home/completed_task.dart';
import 'package:uptodo/view/widget/home/today_task.dart';


class HomeTask extends StatelessWidget {
     HomeTask({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
          padding: StyleManager.pagePadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                SizedBox(
                  height: 70,
                  child: CustomTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      label: "Search for your task . . .",
                    prefixIcon: IconlyLight.search,
                   ),
                ),
                 const TodayTask(),
                 const CompletedTask(),
              ],
            ),
          ),
        ),
    );
}
}
