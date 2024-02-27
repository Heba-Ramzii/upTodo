import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../theme/style_manager.dart';

class CustomMaterialButton extends StatelessWidget {
    const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onPressed, this.color=ThemeColors.primary,
  });
  final String text;
  final  Color? color;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(4.0))),
      color:color ,
      textColor: ThemeColors.fontColorDark,
      onPressed:onPressed,
      child:Text(
        text.toUpperCase(),
        style: StyleManager.textStyleDark16.copyWith(
            fontWeight: FontWeight.normal
        ),
      ),
    );
  }
}
