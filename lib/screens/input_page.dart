import 'package:bmi_calculator/calculations.dart';
import 'package:bmi_calculator/resources/color_manager.dart';
import 'package:bmi_calculator/resources/icons_manager.dart';
import 'package:bmi_calculator/resources/strings_manager.dart';
import 'package:bmi_calculator/resources/values_manager.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:bmi_calculator/widgets/input_page_widgets/card.dart';
import 'package:flutter/material.dart';

import '../resources/text_manager.dart';
import '../widgets/commun_widgets/bottom_button.dart';
import '../widgets/input_page_widgets/card_content.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int heightValue = 183;
  int weightValue = 74;
  int ageValue = 19;
  // Color maleCardColor = ColorManager.inactiveColor;
  // Color femaleCardColor = ColorManager.inactiveColor;

  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == ColorManager.inactiveColor) {
  //       maleCardColor = ColorManager.activeColor;
  //       femaleCardColor = ColorManager.inactiveColor;
  //     } else {
  //       maleCardColor = ColorManager.inactiveColor;
  //     }
  //   }
  //
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == ColorManager.inactiveColor) {
  //       femaleCardColor = ColorManager.activeColor;
  //       maleCardColor = ColorManager.inactiveColor;
  //     } else {
  //       femaleCardColor = ColorManager.inactiveColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(StringsManager.mainPageTitle),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    backgroundColor: selectedGender == Gender.male
                        ? ColorManager.activeColor
                        : ColorManager.inactiveColor,
                    cardChild: IconContent(
                        iconTitle: StringsManager.male,
                        mainIcon: IconsManager.maleIcon),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    backgroundColor: selectedGender == Gender.female
                        ? ColorManager.activeColor
                        : ColorManager.inactiveColor,
                    cardChild: IconContent(
                        iconTitle: StringsManager.female,
                        mainIcon: IconsManager.femaleIcon),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardWidget(
              backgroundColor: ColorManager.activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringsManager.height,
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        heightValue.toString(),
                        style: kNumbersStyle,
                      ),
                      Text(StringsManager.unit)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: ColorManager.sliderActiveColor,
                        inactiveTrackColor: ColorManager.sliderInactiveColor,
                        overlayColor: ColorManager.bottomBarColorOverlay,
                        thumbColor: ColorManager.bottomBarColor,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: AppSizeManager.s15),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: AppSizeManager.s30)),
                    child: Slider(
                      min: Values.minimumHeight,
                      max: Values.maximumHeight,
                      // activeColor: ColorManager.sliderActiveColor,

                      value: heightValue.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          heightValue = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardWidget(
                    backgroundColor: ColorManager.activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsManager.weight,
                          style: labelTextStyle,
                        ),
                        Text(
                          weightValue.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPressedControl: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                                selectedIcon: IconsManager.minusIcon),
                            SizedBox(
                              width: AppSizeManager.s10,
                            ),
                            RoundIconButton(
                                onPressedControl: () {
                                  setState(() {
                                    weightValue++;
                                  });
                                },
                                selectedIcon: IconsManager.plusIcon),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardWidget(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsManager.age,
                          style: labelTextStyle,
                        ),
                        Text(
                          ageValue.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                onPressedControl: () {
                                  setState(() {
                                    ageValue--;
                                  });
                                },
                                selectedIcon: IconsManager.minusIcon),
                            SizedBox(
                              width: AppSizeManager.s10,
                            ),
                            RoundIconButton(
                                onPressedControl: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                                selectedIcon: IconsManager.plusIcon),
                          ],
                        )
                      ],
                    ),
                    backgroundColor: ColorManager.activeColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: StringsManager.calculate,
            routingTo: () {
              Calculations doingCalculations =
                  Calculations(weight: weightValue, height: heightValue);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Results(
                      bmiResult: doingCalculations.BMICalculation(),
                      interpretation: doingCalculations.getInterpretation(),
                      resultText: doingCalculations.getResult(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.selectedIcon, required this.onPressedControl});

  final IconData selectedIcon;
  final void Function() onPressedControl;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressedControl,
      elevation: AppSizeManager.s6,
      constraints: const BoxConstraints.tightFor(
        width: AppSizeManager.s56,
        height: AppSizeManager.s56,
      ),
      shape: CircleBorder(),
      fillColor: ColorManager.controlButtonColor,
      child: Icon(selectedIcon),
    );
  }
}
