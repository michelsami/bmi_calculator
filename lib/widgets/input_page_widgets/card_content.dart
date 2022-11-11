import 'package:flutter/material.dart';

import '../../../resources/text_manager.dart';
import '../../../resources/values_manager.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {required this.mainIcon, required this.iconTitle, super.key});

  final IconData mainIcon;
  final String iconTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          mainIcon,
          size: AppSizeManager.s60,
        ),
        const SizedBox(
          height: AppSizeManager.s15,
        ),
        Text(
          iconTitle,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
