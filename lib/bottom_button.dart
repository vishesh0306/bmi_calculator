import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  BottomButton(this.buttonText, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap();}, // Invoke the onTap function here
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        color: bottomContainerColour,
        width: double.infinity,
        height: bottomContainerHeight,
        alignment: Alignment.center,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: BigTextStyle,
        ),
      ),
    );
  }
}
