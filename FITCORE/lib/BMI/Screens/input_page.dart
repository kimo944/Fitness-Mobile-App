import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in/BMI/Components/BottomContainer_Button.dart';
import 'package:sign_in/BMI/Components/Icon_Content.dart';
import 'package:sign_in/BMI/Components/Reusable_Bg.dart';
import 'package:sign_in/BMI/Components/RoundIcon_Button.dart';
import 'package:sign_in/BMI/calculator_brain.dart';
import 'package:sign_in/BMI/constants.dart';
import 'Results_Page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  //by default male will be selected

  bool selectedGender = true;
  int height = 180;
  int weight = 50;
  int age = 20;
  Map activities = {0: 'Weak', 1: 'Moderate', 2: 'Strong'};
  Object? sportSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bbbbbbbbbbbbbbbbb.jpg"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(6),
              physics: ScrollPhysics(),
              children: [
                ReusableBg(
                  colour: kactiveCardColor,
                  cardChild: new Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new TextButton(
                      onPressed: selectDateOfBirth,
                      child: textWithStyle(
                          (age == null)
                              ? "Tap to enter your age"
                              : "Your age is : ${age!.toInt()}",
                          color: Colors.white),
                      style: ButtonStyle(
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Select Male
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, 'Food');
                            });
                          },
                          child: ReusableBg(
                            colour: kactiveCardColor,
                            cardChild: IconContent(
                                myicon: FontAwesomeIcons.appleWhole,
                                text: 'Food'),
                          ),
                        ),
                      ),

                      //Select female
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(context, 'Activity');
                            });
                          },
                          child: ReusableBg(
                            colour: kactiveCardColor,
                            cardChild: IconContent(
                                myicon: FontAwesomeIcons.footballBall,
                                text: 'Activity'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReusableBg(
                    colour: kactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kDigitTextStyle,
                            ),
                            Text(
                              'cm',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: ksliderInactiveColor,
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 35.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // Select Male
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = true;
                            });
                          },
                          child: ReusableBg(
                              colour: selectedGender == true
                                  ? kactiveCardColor
                                  : kinactiveCardColor,
                              cardChild: selectedGender == true
                                  ? IconContent(
                                      myicon: FontAwesomeIcons.mars,
                                      text: 'MALE')
                                  : IconContent(
                                      myicon: FontAwesomeIcons.mars,
                                      text: 'male')),
                        ),
                      ),

                      //Select female
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = false;
                              });
                            },
                            child: ReusableBg(
                                colour: selectedGender == false
                                    ? kactiveCardColor
                                    : kinactiveCardColor,
                                cardChild: selectedGender == false
                                    ? IconContent(
                                        myicon: FontAwesomeIcons.venus,
                                        text: 'FEMALE')
                                    : IconContent(
                                        myicon: FontAwesomeIcons.venus,
                                        text: 'female'))),
                      ),
                    ],
                  ),
                ),
                ReusableBg(
                  colour: kactiveCardColor,
                  cardChild: Column(
                    children: [
                      new Padding(
                          padding: EdgeInsets.all(15.0),
                          child: textWithStyle(
                              "What is your sporting activity?",
                              color: Colors.white)),
                      new Padding(
                          padding: EdgeInsets.all(15.0), child: rowRadio()),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReusableBg(
                          colour: kactiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: klabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kDigitTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomContainer(
                  text: 'CALCULATE',
                  onTap: () {
                    Calculate calc = Calculate(
                      height: height,
                      weight: weight,
                      age: age,
                      Gender: selectedGender,
                      sport: sportSelection,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          ibw: calc.result5(),
                          BFP: calc.result4(),
                          TDEE: calc.result3(),
                          bmr: calc.result2(),
                          bmi: calc.result(),
                          resultText: calc.getText(),
                          advise: calc.getAdvise(),
                          advise2: Gender == true
                              ? calc.getAdviseMale2()
                              : calc.getAdvisefeMale2(),
                          textColor: calc.getTextColor(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textWithStyle(String data, {color = Colors.black, fontSize = 15.0}) {
    return Text(data,
        textAlign: TextAlign.center,
        style: new TextStyle(color: color, fontSize: fontSize));
  }

  Row rowRadio() {
    List<Widget> l = [];
    activities.forEach((key, value) {
      Column column = new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Radio<Object>(
              value: key,
              groupValue: sportSelection,
              onChanged: (Object? i) {
                setState(() {
                  sportSelection = i;
                });
              }),
          textWithStyle(value, color: Colors.white)
        ],
      );
      l.add(column);
    });
    return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: l);
  }

  Future<Null> selectDateOfBirth() async {
    DateTime? choice = await showDatePicker(
        context: context,
        initialDatePickerMode: DatePickerMode.year,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());
    if (choice != null) {
      setState(() {
        var diff = new DateTime.now().difference(choice);
        var days = diff.inDays;
        var years = (days / 365);
        setState(() {
          age = years.toInt();
        });
      });
    }
  }
}
