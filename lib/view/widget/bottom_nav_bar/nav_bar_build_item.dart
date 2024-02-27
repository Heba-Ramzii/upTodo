import 'package:flutter/material.dart';
import '../../../core/constants/theme/style_manager.dart';
import '../../../core/constants/theme/theme.dart';

class NavBarBuildItem extends StatelessWidget {
  const NavBarBuildItem({super.key,
    required this.label,
    required this.icon,
    required this.onTap}
      );
final String label;
final IconData icon;
final  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
           Icon(
            icon,
            size: 30,
            color:ThemeColors.fontColorDark,
          ),
           const SizedBox(height: 8,),
           Text(
          label,
          style: StyleManager.textStyleDark12,
          ),
        ],
      ),
    );
  }
}
