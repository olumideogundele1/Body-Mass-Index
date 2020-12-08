import 'package:flutter/material.dart';

import 'constants.dart';



class CardWidget extends StatelessWidget {
  final IconData icon;
  final String text;


  CardWidget({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            icon,
            size:kIconSize
        ),
        SizedBox(
          height: kSizeBoxHeight,
        ),
        Text(text, style:TextStyle(
            fontSize: kFontSize,
            color: kColorCode
        ))
      ],
    );
  }
}