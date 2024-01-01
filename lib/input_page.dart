import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'MaleFemale.dart';
import 'constants.dart';
import 'Result_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';



class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender{
  Male,
  Female,
}

class _InputPageState extends State<InputPage> {

Color maleCardcolor = inactiveCardColour;
Color femaleCardcolor = inactiveCardColour;

Gender? SelectedGender;

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
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      SelectedGender = Gender.Male;
                    });

                  },
                  child: ReusableCard(SelectedGender == Gender.Male? activeCardColour:inactiveCardColour,
                    MaleFemale(FontAwesomeIcons.mars,"MALE"),

                  ))),
              Expanded(child: GestureDetector(
                  onTap: (){
                    setState(() {
                      SelectedGender = Gender.Female;
                    });

                  },
                  child: ReusableCard(SelectedGender==Gender.Female?activeCardColour:inactiveCardColour,MaleFemale(FontAwesomeIcons.venus,"FEMALE"))),
              )],
          )),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(activeCardColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',style: TextStyle(fontSize: 20,color: ActiveColor),),
                  // SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(Height.toString(),
                      style: BigNumberStyle
                      ),

                      Text('cm',style: TextStyle(fontSize: 20),)
                    ],
                  ),
                  
                  SliderTheme(data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    thumbColor: Colors.pinkAccent,
                    overlayColor: Color(0x40ffc0cb)

                  ),
                    child: Slider(value: Height.toDouble(),
                        min: 120,
                        max: 220,
                        // activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                        onChanged: (double newHeight){
                      setState(() {
                        Height = newHeight.round();
                      });
                    }),
                  )
                ],
              )
              ),),
            ],
          )),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(activeCardColour,Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('WEIGHT',    style: TextStyle(fontSize: 20,color: ActiveColor),),
                  Text(Weight.toString(),   style: BigNumberStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(FontAwesomeIcons.minus,
                              (){
                        setState(() {
                          Weight--;
                        });
                      }),
                      SizedBox(width: 10,),

                      RoundIconButton(FontAwesomeIcons.plus,(){
                        setState(() {
                          Weight++;
                        });
                      })
                    ],
                  )
                  
                ],
              )),),
              Expanded(child: ReusableCard(activeCardColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',    style: TextStyle(fontSize: 20,color: ActiveColor),),
                      Text(age.toString(),   style: BigNumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus,(){
                            setState(() {
                              age--;
                            });
                          }),

                          SizedBox(width: 10,),
                          RoundIconButton(FontAwesomeIcons.plus,(){
                            setState(() {
                              age++;
                            });
                          })
                        ],
                      )
              ],
              ))),
            ],
          )),

          BottomButton('CALCULATE',
                (){

            CalculatorBrain calc = CalculatorBrain(Height, Weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(calc.calculateBMI(),calc.getResult(),calc.getInterpretation())));
          },)

        ],
      )

  );
}
}
