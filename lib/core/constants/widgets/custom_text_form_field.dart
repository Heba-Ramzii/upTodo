import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/theme/style_manager.dart';
import 'package:uptodo/core/constants/theme/theme.dart';

Widget CustomTextFormField ({
  Color? colorFont = ThemeColors.gray,
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  final Function(String)? onChange,
  GestureTapCallback? onTap,
  bool isClickable = true,
  bool isPassword = false,
   required String label,
   Function()? suffixPressed,
    IconData? prefixIcon,
  double iconSize = 24,
}) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: TextFormField(
     style: StyleManager.textStyleDark16,
     controller: controller ,
    keyboardType: type,
    obscureText: isPassword,
    onFieldSubmitted:onSubmit,
    onTap: onTap,
    onChanged:onChange ,
    //enabled: isClickable,
      decoration: InputDecoration(
        prefixIcon:Icon(
          prefixIcon,
          size: iconSize,
          color: ThemeColors.gray,
        ),
      hintStyle: StyleManager.textStyleDark16.copyWith(
        color: colorFont,
      ),
      fillColor: ThemeColors.dark,
        filled: false,
        hintText: label,
       border:  const OutlineInputBorder(
          borderRadius : BorderRadius.all(Radius.circular(5)),
        borderSide: BorderSide(
          color: ThemeColors.borderColor,
        ),
         gapPadding: 10.0,
      ),
    ),
  ),
);