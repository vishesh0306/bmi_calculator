import 'package:flutter/material.dart';
import 'constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton(this.buttomTitle,this.onTap);

  final VoidCallback onTap;
  final String buttomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        color: bottomContainerColour,
        width: double.infinity,
        height: bottomContainerHeight,
        alignment: Alignment.center,
        child: Text(buttomTitle,textAlign: TextAlign.center,style: BigTextStyle,),

      ),
    );
  }
}


