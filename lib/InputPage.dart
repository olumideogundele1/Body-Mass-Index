import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'IconContent.dart';
import 'ReusableCard.dart';
import 'constants.dart';



enum GenderType{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

//  Color maleCardColor = inActiveColor;
//  Color femaleCardColor = inActiveColor;
//
//  void updateCard(GenderType gender){
//    //male card pressed
//    if(gender == GenderType.male){
//      if(maleCardColor == inActiveColor){
//        maleCardColor = activeColor;
//        femaleCardColor = inActiveColor;
//      }else{
//        maleCardColor = inActiveColor;
//       femaleCardColor = activeColor;
//      }
//    }
//
//    //female card pressed
//    if(gender == GenderType.female){
//      if(femaleCardColor == inActiveColor){
//        femaleCardColor = activeColor;
//        maleCardColor = inActiveColor;
//      }else{
//        femaleCardColor = inActiveColor;
//        maleCardColor = activeColor;
//      }
//    }
//  }

  GenderType selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child:
              Row(
                children: <Widget>[
                    Expanded(child: ReusableCard(
                      onPress:(){
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                        } ,
                        reUsableColor: selectedGender == GenderType.male ? kActiveColor : kInActiveColor,
                        cardChild: CardWidget(
                            icon:FontAwesomeIcons.mars,
                          text:'MALE'
                        ),),
                    ),
                  Expanded(
                      child: ReusableCard(
                        onPress:(){
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        } ,
                    reUsableColor: selectedGender == GenderType.female ? kActiveColor : kInActiveColor,
                    cardChild: CardWidget(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE'
                    ),
                  )
                  ),
                ]
              ),
          ),
          Expanded(
              child: ReusableCard(
                  reUsableColor: kActiveColor,
                  cardChild: Column(
                    children: <Widget>[

                      Text('HEIGHT',
                        style:TextStyle(
                            fontSize: kFontSize,
                            color: kColorCode
                        ),)
                    ],
                  ),
              ),
          ),
          Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(reUsableColor: kActiveColor),
                  ),
                  Expanded(
                    child: ReusableCard(reUsableColor: kActiveColor),
                  )
                ],
              ),
          ),
        Container(
          color: Color(0xFFEB1D15),
          margin: EdgeInsets.only(top: 10.0),
          height: 80.0,
          width: double.infinity,
        )
        ],
      ),

    );
  }
}
//
