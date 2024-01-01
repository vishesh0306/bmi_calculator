import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  ReusableCard(this.colour,this.childCard);

  final Color colour;
  final Widget childCard;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all((15)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour
      ),
    );

  }
}