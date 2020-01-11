import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.fondo, this.cardchild, this.onPress});

  final Color fondo;
  final Widget cardchild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: fondo,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardchild,
      ),
    );
  }
}
