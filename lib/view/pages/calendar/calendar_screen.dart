import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/theme/theme.dart';

import '../../../core/constants/theme/style_manager.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ( ){
              Navigator.pop(context);
            },
            icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              color: ThemeColors.fontColorDark,
              size: 24,
            ),
        ),
      ),
      body: const Center(
        child: Text("CalendarScreen",
          style: StyleManager.titleStyle32,
        ),
      ),
    );
  }
}
