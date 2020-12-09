import 'package:bmi_calculator/components/CalculateBMI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/IconContent.dart';
import 'ResultPage.dart';
import '../components/ReusableCard.dart';
import '../components/constants.dart';



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
  int height = 180;
  int weight = 12;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',
//                        textAlign: TextAlign.center,
                        style:kLabelStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                            style: kTextStyle,
                          ),
                          Text('cm',style: kLabelStyle,),

                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,

                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                            }
                        ),
                      )
                    ],
                  ),
              ),
          ),
          Expanded(
              child:Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(reUsableColor: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',
                          style: kLabelStyle,),
                          Text(
                            weight.toString(),
                            style: kTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.minus),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus),
                            ],
                          )
                        ],
                      ),),
                  ),
                  Expanded(
                    child: ReusableCard(
                        reUsableColor: kActiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',
                            style: kLabelStyle,),
                          Text(
                            age.toString(),
                            style: kTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.minus),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  iconData: FontAwesomeIcons.plus),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
        GestureDetector(
          onTap: (){
            CalculateBMI calc = CalculateBMI(weight: weight,height: height);
            Navigator.push(context,MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              bmiText: calc.getResult(),
              bmiInterpretation: calc.getInterpretation(),
            )));
          },
          child: Container(
            child: Center(
              child: Text('CALCULATE',style: kLargeNumberButtonStyle,),
            ),
            decoration: BoxDecoration(
            color: Color(0xFFEB1D15),
            borderRadius: BorderRadius.circular(20.0)
            ),
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(bottom: 10.0),
            height: 80.0,
            width: double.infinity,
          ),
        )
        ],
      ),
    );
  }
}
//
class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.onPressed, @required this.iconData});

  final Function onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      fillColor: Color(0xFF8D8E98),
      child: Icon(iconData),
    );
  }
}
