import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key,
    this.iconColor=ThemeColors.fontColorDark,
    this.iconSize = 24,
    required this.onPressed,
    required this.icon
});
  final String icon;
  final Color iconColor;
final double iconSize ;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
         height: iconSize,
        width: iconSize,
        color: iconColor,
      ),
    );
  }
}
