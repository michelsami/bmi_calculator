import 'package:flutter/material.dart';

import 'color_manager.dart';

const labelTextStyle = TextStyle(
  fontSize: FontSizeManager.s18,
  color: ColorManager.iconTitleColor,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: FontSizeManager.s25,
  fontWeight: FontWeight.bold,
);

const kNumbersStyle = TextStyle(
  fontSize: FontSizeManager.s50,
  fontWeight: FontWeight.w900,
);

const kTitleTextStyle = TextStyle(
  fontSize: FontSizeManager.s50,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  fontSize: FontSizeManager.s22,
  fontWeight: FontWeight.bold,
  color: ColorManager.resultTextColor,
);

const kBMITextStyle = TextStyle(
  fontSize: FontSizeManager.s100,
  fontWeight: FontWeight.bold,
);

const kBMIAnalysisTextStyle = TextStyle(
  fontSize: FontSizeManager.s22,
);

class FontSizeManager {
  static const double s18 = 18.0;
  static const double s22 = 22.0;
  static const double s25 = 25.0;
  static const double s50 = 50.0;
  static const double s100 = 100.0;
}
