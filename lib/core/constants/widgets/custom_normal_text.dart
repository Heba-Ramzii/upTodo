import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomNormalText extends StatelessWidget {
  CustomNormalText({
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
          fontSize: 16,
          fontWeight: FontWeight.w400
      ),
    );
  }
}
