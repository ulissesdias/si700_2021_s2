import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetsStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WidgetsStatefulState();
  }
}

class WidgetsStatefulState extends State<StatefulWidget> {
  bool checkBoxValue = false;
  bool switchValue = false;
  double sliderValue = 10;
  int radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stateful")),
        body: Container(
            child: Column(
          children: [
            myCheckBox(),
            mySwitch(),
            mySlider(),
            myRadio(1),
            myRadio(2),
            myRadio(3)
          ],
        )));
  }

  Widget myCheckBox() {
    return Checkbox(
      onChanged: (bool value) {
        setState(() {
          checkBoxValue = value;
        });
      },
      value: checkBoxValue,
    );
  }

  Widget mySwitch() {
    return Switch(
        value: switchValue,
        onChanged: (bool inValue) {
          setState(() {
            switchValue = inValue;
          });
        });
  }

  Widget mySlider() {
    return Slider(
        min: 0,
        max: 20,
        value: sliderValue,
        onChanged: (double inValue) {
          setState(() => sliderValue = inValue);
        });
  }

  Widget myRadio(int value) {
    return Radio(
      groupValue: radioValue,
      onChanged: (int inValue) {
        setState(() {
          radioValue = inValue;
        });
      },
      value: value,
    );
  }
}
