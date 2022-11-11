import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.routingTo, required this.buttonTitle});

  final void Function() routingTo;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: routingTo,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: ColorManager.bottomBarColor,
        height: AppSizeManager.s80,
        margin: const EdgeInsets.only(top: MarginManager.m10),
        // padding: EdgeInsets.only(bottom: PaddingManager.p20),
        width: double.infinity,
      ),
    );
  }
}
