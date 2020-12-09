
import 'package:bmi_calculator/components/ReusableCard.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: Text('Your Result', style: kTitleStyle))),
          Expanded(
              flex: 5,
              child: ReusableCard(
                reUsableColor: kActiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      Text('Overview',style: kResultTextStyle,),
                    Text('18.3',style: kBmiTextStyle,),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Your BMI result is quite low, you should eat more',
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ],
                ),
              )),
          BottomButtonWidget()
        ],
      ),
    );
  }
}

class BottomButtonWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        child: Center(child: Text('Re - Calculate',style: kLargeNumberButtonStyle,)),
        decoration: BoxDecoration(
            color: Color(0xFFEB1D15),
          borderRadius: BorderRadius.circular(20.0)
        ),
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}
