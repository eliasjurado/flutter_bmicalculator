import 'package:flutter/material.dart';
import 'package:flutter_bmi/components/BottomButton.dart';
import 'package:flutter_bmi/components/ReusableCard.dart';
import 'package:flutter_bmi/constants.dart';
import 'package:flutter_bmi/strings.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.bmiText,
    @required this.bmiInterpretation,
    @required this.bmiRange,
  });

  final String bmiResult;
  final String bmiText;
  final String bmiInterpretation;
  final String bmiRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(str_appbartitle),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  str_resulttitle,
                  style: kIndicatorStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                fondo: kActiveCardColor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiText.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: bmiText == str_level2
                          ? kGreenResultTextStyle
                          : (bmiText == str_level1 || bmiText == str_level3
                              ? kYellowResultTextStyle
                              : kRedResultTextStyle),
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      bmiRange,
                      style: kBodyResultTextStyle,
                    ),
                    Text(
                      bmiInterpretation,
                      style: kBodyResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: str_btn_recalculate,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
