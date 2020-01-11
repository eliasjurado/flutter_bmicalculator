import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.icon,
    @required this.onPressed,
    //@required this.loopActive,
  });
  final IconData icon;
  final Function onPressed;
  //final bool loopActive;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0xff4c4f5e),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      onPressed: onPressed,
      //onLongPress: loopActive ? onPressed : () {},
      child: Icon(icon),
    );
  }
}
