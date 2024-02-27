import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/theme/theme.dart';

abstract class StyleManager {
  // title
  static const titleStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: ThemeColors.fontColorDark
  );
  // subtitle, form field, (switch, check box title)
  static const textStyleDark20 = TextStyle(
    fontSize: 20,
      color: ThemeColors.fontColorDark,
      fontWeight: FontWeight.w400
  );

   static const textStyleDark18 = TextStyle(
          fontSize: 18,
          color: ThemeColors.fontColorDark
      );

  static const textStyleDark16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
      color: ThemeColors.fontColorDark

  );
   static const textStyleDark14 = TextStyle(
      fontSize: 14,
       color: ThemeColors.fontColorDark
  );
   static const textStyleDark12 = TextStyle(
      fontSize: 12,
       color: ThemeColors.fontColorDark
  );
   static const textStyle14 = TextStyle(
      fontSize: 14,
       //color: ColorsManager.fontColorLight,
  );
   static const textStyle16 = TextStyle(
      fontSize: 16,
      // color: ColorsManager.fontColorLight,

   );

  static const pagePadding = EdgeInsets.symmetric(horizontal: 24.0,vertical: 30);


}
