import 'package:flutter/material.dart';
import 'package:flutter_bmi/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icono, this.texto});

  final IconData icono;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icono,
          size: kIconSize,
        ),
        SizedBox(
          height: kHeightSizedBox,
        ),
        Text(
          texto,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
