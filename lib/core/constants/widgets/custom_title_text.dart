import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomTitleText extends StatelessWidget {
    CustomTitleText({
      super.key,
      required this.text
    });
    String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: ThemeColors.fontColorDark,
          fontSize: 32,
          fontWeight: FontWeight.w700
      ),
    );
  }
}
