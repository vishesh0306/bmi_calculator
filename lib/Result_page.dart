import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {

  ResultPage(this.bmiResult,this.bmiText,this.bmiInterpretation);

  final String bmiResult;
  final String bmiText;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI RESULT',textAlign: TextAlign.center,),),

      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(child: Text('YOUR RESULT',textAlign: TextAlign.start, style: BigTextStyle)),
          ),

          // SizedBox(height: 10,),

          Expanded(flex: 5, child: ReusableCard(activeCardColour,Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Text(bmiText,style: ResultTitleStyle,),
              Text(bmiResult,style: ResultValueStyle,),
              Text(bmiInterpretation, style: ResulDataStyle,textAlign: TextAlign.center,)
            ],
          )),),

          BottomButton('RECALCULATE',
          (){
           Navigator.pop(context);})

        ],
      ),
    );
  }
}
