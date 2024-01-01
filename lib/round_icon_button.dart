import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton(this.icon,this.onPressed);

  final IconData icon;


  //AGAR final Function onPress USE KARA TOH ERROR AAYI.... ISILIYE voidCallback USE KIYA!!
  final VoidCallback onPressed;
  //VoidCallback instead of Function for the onPressed.
  // By the way VoidCallback is just shorthand for void Function() so you could also define it as final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
          width: 50,height: 50
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Colors.grey[500],
      elevation: 3,

    );
  }
}


