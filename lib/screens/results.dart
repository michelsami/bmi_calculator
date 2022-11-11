import 'package:bmi_calculator/resources/color_manager.dart';
import 'package:bmi_calculator/resources/strings_manager.dart';
import 'package:bmi_calculator/resources/text_manager.dart';
import 'package:bmi_calculator/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../widgets/commun_widgets/bottom_button.dart';
import '../widgets/input_page_widgets/card.dart';

class Results extends StatelessWidget {
  Results(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(StringsManager.mainPageTitle),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(PaddingManager.p15),
              alignment: Alignment.bottomLeft,
              child: Text(
                StringsManager.yourResult,
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardWidget(
              backgroundColor: ColorManager.activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Column(
                    children: [
                      Text(
                        "Normal BMI range :",
                        style: labelTextStyle,
                      ),
                      Text(
                        "18,5 - 25 kg/m2",
                        style: kBMIAnalysisTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    interpretation,
                    style: kBMIAnalysisTextStyle,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              buttonTitle: StringsManager.reCalculate,
              routingTo: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
