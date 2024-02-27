import 'package:flutter/material.dart';

import '../../../core/constants/theme/theme.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        backgroundColor: ThemeColors.primary,
        shape: const CircleBorder(),
        onPressed:onPressed,
        elevation: 1.0,
        child: const Icon(
          Icons.add,
          color: ThemeColors.fontColorDark,

        ),
      ),
    );
  }
}
