import 'package:flutter/material.dart';
import 'constants.dart';

class MaleFemale extends StatelessWidget {

  final IconData gender;

  MaleFemale(this.gender, this.textData);

  final String textData;
  final Color ActiveColor = Color(0xFF8D8E98);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(gender,size: 60,),
        SizedBox(height: 20,),
        Text(textData,style: TextStyle(fontSize: 20,color: ActiveColor),)
      ],

    );
  }
}
