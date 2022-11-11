import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class CardWidget extends StatelessWidget {
  final Color backgroundColor;
  final Widget? cardChild;
  final void Function()? onPress;

  const CardWidget(
      {super.key, required this.backgroundColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(MarginManager.m15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSizeManager.s10),
        ),
        child: cardChild,
      ),
    );
  }
}
