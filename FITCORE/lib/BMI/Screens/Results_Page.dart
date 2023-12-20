//import 'package:bmi/Components/BottomContainer_Button.dart';
//import 'package:bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_in/BMI/Screens/input_page.dart';
import '../Components/BottomContainer_Button.dart';
import '../Components/Reusable_Bg.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String bmr;
  final String ibw;
  final String TDEE;
  final String BFP;
  final String advise;
  final String advise2;

  final Color textColor;

  ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.bmr,
      required this.ibw,
      required this.TDEE,
      required this.BFP,
      required this.advise2,
      required this.advise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0A0E21),
      // appBar: AppBar(
      //   centerTitle: true,
      //   leading: Icon(null),
      //   backgroundColor: Color.fromARGB(
      //     255,
      //     255,
      //     230,
      //     0,
      //   ),
      //   title: Row(
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text(
      //         'FitCalculator',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bccccccccc.jpg"), fit: BoxFit.cover),
        ),
        child: ListView(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Result',
                  style: ktitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmi,
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Normal BMI range:',
                        style: klabelTextStyle,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: kBodyTextStyle,
                      ),
                      Text(
                        advise,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                      Image.asset("images/Screenshot 2023-09-25 111932.png"),
                      SizedBox(
                        height: 15.0,
                      ),
                      // RawMaterialButton(
                      //   onPressed: () {},
                      //   constraints: BoxConstraints.tightFor(
                      //     width: 200.0,
                      //     height: 56.0,
                      //   ),
                      //   fillColor: Color(0xFF4C4F5E),
                      //   elevation: 0.0,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10.0)),
                      //   child: Text(
                      //     'SAVE RESULT',
                      //     style: kBodyTextStyle,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "BMR",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   resultText,
                      //   style: TextStyle(
                      //     color: textColor,
                      //     fontSize: 27.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Text(
                        bmr,
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Basal Metabolic Rate (BMR) :',
                        style: klabelTextStyle,
                      ),
                      Text(
                        'Amount of energy \n that your body needs to function if it were to rest for 24 hours.',
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                      // Text(
                      //   advise,
                      //   textAlign: TextAlign.center,
                      //   style: kBodyTextStyle,
                      // ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        TDEE,
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Total Daily Energy Expenditure',
                        style: klabelTextStyle,
                      ),
                      Text(
                        'the total energy uses in a day',
                        style: kBodyTextStyle,
                      ),
                      Text(
                        advise,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Body Fat Percentage",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        BFP + " %",
                        style: kBMITextStyle,
                      ),
                      Text(
                        'Normal BFP range:',
                        style: klabelTextStyle,
                      ),
                      Text(
                        advise2,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Gender == true
                          ? Image.asset('images/body-fat-man.png')
                          : Image.asset('images/body-fat-woman.png'),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableBg(
                colour: kactiveCardColor,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Ideal Body Weight",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 27.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ibw,
                        style: kBMITextStyle,
                      ),
                      // Text(
                      //   'Ideal Body Weight Must be:',
                      //   style: klabelTextStyle,
                      // ),
                      // Text(
                      //   '18.5 - 25 kg/m2',
                      //   style: kBodyTextStyle,
                      // ),
                      // Text(
                      //   advise,
                      //   textAlign: TextAlign.center,
                      //   style: kBodyTextStyle,
                      // ),
                      SizedBox(
                        height: 15.0,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        constraints: BoxConstraints.tightFor(
                          width: 200.0,
                          height: 56.0,
                        ),
                        fillColor: Color(0xFF4C4F5E),
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          'SAVE RESULT',
                          style: kBodyTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomContainer(
                text: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
