import 'package:flutter/material.dart';

import '../../../core/constants/theme/style_manager.dart';

class CategoryBoxItem extends StatelessWidget {
  const CategoryBoxItem({
    super.key,
     required this.icon,
    required this.name,
    required this.background,
  });
  final Widget icon;
  final String name;
   final Color background;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(4),
          ),
          child: icon,
        ),
        const SizedBox(height: 5,),
        Text(
          name,
          style: StyleManager.textStyleDark14,
        ),
      ],
    );
  }
}
