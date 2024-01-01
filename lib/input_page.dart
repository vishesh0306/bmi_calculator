import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'input_data.dart';
import 'reusable_card.dart';
import 'MaleFemale.dart';
import 'constants.dart';
import 'Result_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

class InputPage extends StatelessWidget {

  InputData data = Get.find<InputData>();

  Color maleCardcolor = inactiveCardColour;

  Color femaleCardcolor = inactiveCardColour;

  int Height = 180;

  int Weight = 60;

  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          data.SelectedGender?.value = Gender.Male;
                        },
                        child:
                        Obx(()=>ReusableCard(
                          data.SelectedGender?.value == Gender.Male
                              ? activeCardColour
                              : inactiveCardColour,
                          MaleFemale(FontAwesomeIcons.mars, "MALE"),
                        )
                        )
                    ),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        data.SelectedGender?.value = Gender.Female;
                      },
                      child:
                      Obx(()=>ReusableCard(
                          data.SelectedGender?.value == Gender.Female
                              ? activeCardColour
                              : inactiveCardColour,
                          MaleFemale(FontAwesomeIcons.venus, "FEMALE")
                      )
                      )
                  )
                )
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      activeCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: TextStyle(fontSize: 20, color: ActiveColor),
                          ),
                          // SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Obx(() {
                                return Text(data.Height.toString(),
                                    style: BigNumberStyle);
                              }),
                              Text(
                                'cm',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),

                          Obx(() => SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.white,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 10),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 25),
                                  thumbColor: Colors.pinkAccent,
                                  overlayColor: Color(0x40ffc0cb)),
                              child: Slider(
                                  value: data.Height.toDouble(),
                                  min: 120,
                                  max: 220,
                                  // activeColor: Colors.white,
                                  inactiveColor: Colors.grey,
                                  onChanged: (double newHeight) {
                                    data.Height.value = newHeight.round();
                                  })))
                        ],
                      )),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      activeCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: TextStyle(fontSize: 20, color: ActiveColor),
                          ),
                          Obx(() {
                            return Text(
                              data.Weight.toString(),
                              style: BigNumberStyle,
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                data.decreaseWeight();
                              }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                data.increaseWeight();
                              })
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                    child: ReusableCard(
                        activeCardColour,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style:
                                  TextStyle(fontSize: 20, color: ActiveColor),
                            ),
                            Obx(() {
                              return Text(
                                data.age.toString(),
                                style: BigNumberStyle,
                              );
                            }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  data.decreaseAge();
                                }),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  data.increaseAge();
                                })
                              ],
                            )
                          ],
                        ))),
              ],
            )),
            BottomButton('CALCULATE', () {
              CalculatorBrain calc = CalculatorBrain(data.Height.toInt(), data.Weight.toInt());
              Get.to(() => ResultPage(calc.calculateBMI(), calc.getResult(),
                  calc.getInterpretation()));
            })
          ],
        ));
  }
}
