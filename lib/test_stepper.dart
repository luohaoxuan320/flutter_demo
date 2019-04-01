import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: '测试StepView',
      home: new Scaffold(
        appBar: new AppBar(
          title: Text('测试StepView'),
        ),
        body: new Center(
          child: MyStepper(),
        ),
      ),
    ));

class MyStepper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStepperState();
  }
}

class MyStepperState extends State<MyStepper> {
  int cur_step = 0;
  List<Step> mySteps = [
    Step(title: Text("第1步"), content: Text('hello'), isActive: true),
    Step(
        title: Text("第2步"),
        content: Text('world '),
        isActive: true,
        state: StepState.editing),
    Step(title: Text("第3步"), content: Text('hello world'), isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stepper(
      steps: mySteps,
      currentStep: cur_step,
      type: StepperType.horizontal,
      onStepTapped: (step) {
        print("onStepTapped=$step");
        setState(() {
          cur_step = step;
        });
      },
      onStepCancel: () {
        setState(() {
          if (cur_step > 0) {
            cur_step--;
          } else {
            cur_step = 0;
          }
        });
        print("onStepCancel $cur_step");
      },
      onStepContinue: () {
        setState(() {
          if (cur_step < mySteps.length - 1) {
            cur_step++;
          } else {
            cur_step = 0;
          }
        });
        print("onStepContinue $cur_step");
      },
    );
  }
}
