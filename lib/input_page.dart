import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';

enum Gender{
  male, female, other
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.other;
  int height = 180 ;
  int weight = 60;
  int age = 19;

  // Color maleCardColor = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;

  //1 = male, 2= female
  // void updateColor (Gender selectedGender){
  //   //male card pressed
  //   if (selectedGender==Gender.male){
  //     if(maleCardColor == inactiveCardColour) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColour;
  //     }else{
  //       maleCardColor = inactiveCardColour;
  //     }
  //   }
  //   //female card pressed
  //   if (selectedGender == Gender.female){
  //     if (femaleCardColor == inactiveCardColour) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColour;
  //     }else{
  //       femaleCardColor = inactiveCardColour;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
                'BMI CALCULATOR')
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableCard(selectedGender == Gender.male? kActiveCardColor: kInactiveCardColour,
                   IconContent(FontAwesomeIcons.mars, 'MALE'),
                 ),
                ),
               ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(selectedGender == Gender.female? kActiveCardColor: kInactiveCardColour,
                  IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                ),
               ),
              ),
            ],
          ),),
          Expanded(child: ReusableCard(kActiveCardColor,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    SizedBox(
                    width: 3.0,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                       activeTrackColor: Colors.white,
                       trackHeight: 0.5,
                       thumbColor: Color(0xFFEB1555),
                       overlayColor: Color(0x29EB1555),
                       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                       overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                       
                    ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                  ),
                ),
              ],
            ),),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(kActiveCardColor,
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'WEIGHT',
                      style:kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: FloatingActionButton(
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(
                        width: 10.0,
                      ),
                      SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: FloatingActionButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),),
              ),
              Expanded(child: ReusableCard(kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text(
                  'AGE',
                  style:kLabelTextStyle,
                ),
                Text(
                  age.toString(),
                  style: kNumberTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: FloatingActionButton(
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                        backgroundColor: Color(0xFF4C4F5E),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      height: 40.0,
                      width: 40.0,
                      child: FloatingActionButton(
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                        backgroundColor: Color(0xFF4C4F5E),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),],
              ),),
              ),
            ],
           ),
          ),
          GestureDetector(
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
              color: kBottomContColor,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: kBottomContHeight,
            ),
          )
        ],
      )
    );
  }
}

