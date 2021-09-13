import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.interpretation,required this.bmiResult,required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
               kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        resultText.toUpperCase(),
                            style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: BMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    )
                  ],
                )
              ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContHeight,
            ),
          ),
        ],
      )
    );
  }
}
