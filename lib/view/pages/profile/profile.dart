import 'package:flutter/material.dart';

import '../../../core/constants/theme/style_manager.dart';
import '../../../core/constants/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ( ){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ThemeColors.fontColorDark,
            size: 24,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "ProfileScreen",
          style: StyleManager.titleStyle32,
        ),
      ),

    );
  }
}
