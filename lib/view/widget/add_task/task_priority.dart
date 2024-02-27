import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';
import '../../../generated/assets.dart';

class TaskPriority extends StatefulWidget {
  const TaskPriority({super.key});

  @override
  State<TaskPriority> createState() => _TaskPriorityState();
}

class _TaskPriorityState extends State<TaskPriority> {
  int? _selectedIndex; // the index of the selected item

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0; // initially select the first item
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         const Padding(
          padding: EdgeInsets.only(bottom: 20.0,),
          child: Divider(),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 4,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0
          ),
           itemCount: 10,
           itemBuilder: (BuildContext context, int index) {
            return InkWell(
              autofocus: true,
              onTap: () {
                setState(() {
                   _selectedIndex = index;
                });
              },
               child: Container(
                decoration: BoxDecoration(
                  color:  index == _selectedIndex ? ThemeColors.primary
                      :ThemeColors.darkBackground,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesFlag,
                      height: 24,
                      width: 24,
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      (index+1).toString(),
                      style: StyleManager.textStyleDark16,
                    )
                  ],
                ),
              ),
            );
          },
        ),
       ],
    );
  }
}
