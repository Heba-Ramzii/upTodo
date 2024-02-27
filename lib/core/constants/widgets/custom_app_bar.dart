import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.darkBackground,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            IconlyLight.arrowLeft2,
            color: ThemeColors.fontColorDark,
            size: 24,
          )
      ),
    );
  }
}
