import 'package:flutter/material.dart';

import '../theme/style_manager.dart';
import '../theme/theme.dart';

 class CustomTextButton extends StatelessWidget {
    CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  String text;
  Function()? onPressed;
    @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:  Text(
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: StyleManager.textStyleDark16.copyWith(
          color: ThemeColors.primary,
        )

      ),
    );
  }
}
