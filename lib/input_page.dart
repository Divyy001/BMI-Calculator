import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reuseCard.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'round_Icon_button.dart';
import 'calucator_brain.dart';

const activecolorOfBoxes = Color(0xFF1D1E33);
const inactivecolorOfBoxes = Color(0xFF111328);
const kLabelTextstyles = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
const kNumberTextstyles = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kCalulateButton = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

enum genDer {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactivecolorOfBoxes;
  Color femaleColor = inactivecolorOfBoxes;

  genDer? SelectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    gesture: () {
                      setState(() {
                        SelectedGender = genDer.male;
                      });
                    },
                    colour: SelectedGender == genDer.male
                        ? activecolorOfBoxes
                        : inactivecolorOfBoxes,
                    cardChild: reusecard(
                      maleorf: Icons.male_sharp,
                      gender: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    gesture: () {
                      setState(() {
                        SelectedGender = genDer.female;
                      });
                    },
                    colour: SelectedGender == genDer.female
                        ? activecolorOfBoxes
                        : inactivecolorOfBoxes,
                    cardChild: reusecard(
                      maleorf: Icons.female_sharp,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable(
              colour: activecolorOfBoxes,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextstyles,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "cm",
                        style: kLabelTextstyles,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayColor: Color(0x29DA8388),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      thumbColor: Colors.pinkAccent,
                      value: height.toDouble(),
                      max: 220.0,
                      min: 120.0,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable(
                    colour: activecolorOfBoxes,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelTextstyles,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextstyles,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icons.exposure_minus_1_rounded,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.plus_one_rounded,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    colour: activecolorOfBoxes,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelTextstyles,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextstyles,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.exposure_minus_1_rounded,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.plus_one_rounded,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonLabel: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    condition: calc.getResult(),
                    detailResult: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
