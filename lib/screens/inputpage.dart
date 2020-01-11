import 'package:flutter/material.dart';
import 'package:flutter_bmi/calculatorBrain.dart';
import 'package:flutter_bmi/components/BottomButton.dart';
import 'package:flutter_bmi/components/IconContent.dart';
import 'package:flutter_bmi/components/ReusableCard.dart';
import 'package:flutter_bmi/components/RoundIconButton.dart';
import 'package:flutter_bmi/constants.dart';
import 'package:flutter_bmi/screens/resultpage.dart';
import 'package:flutter_bmi/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(str_appbartitle),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    fondo: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardchild: IconContent(
                      icono: FontAwesomeIcons.mars,
                      texto: str_male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    fondo: selectedGender == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardchild: IconContent(
                      icono: FontAwesomeIcons.venus,
                      texto: str_female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    fondo: kActiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          str_height,
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kIndicatorStyle,
                            ),
                            Text(
                              str_centimeters,
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xff8d8e98),
                            overlayColor: Color(0x29EB1555),
                            thumbColor: Color(0xFFEA2E4D),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    fondo: kActiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          str_weight,
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kIndicatorStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    fondo: kActiveCardColor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          str_age,
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kIndicatorStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain brain = CalculatorBrain(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: brain.calculateBMI(),
                    bmiText: brain.getResult(),
                    bmiInterpretation: brain.getInterpretation(),
                    bmiRange: brain.getRange(),
                  ),
                ),
              );

              //Navigator.pushNamed(context, '/resultado');
            },
            buttonTitle: str_btn_calculate,
          ),
        ],
      ),
    );
  }
}
