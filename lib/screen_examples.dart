import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class ScreenExamaples extends StatefulWidget {
static String id="/ScreenExamaples";

  @override
  _ScreenExamaplesState createState() => _ScreenExamaplesState();
}

class _ScreenExamaplesState extends State<ScreenExamaples> {
int activeStep = 5;
int upperBound = 6;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              icons: [
                Icon(Icons.supervised_user_circle),
                Icon(Icons.flag),
                Icon(Icons.access_alarm),
                Icon(Icons.supervised_user_circle),
                Icon(Icons.flag),
                Icon(Icons.access_alarm),
                Icon(Icons.supervised_user_circle),
              ],

              // activeStep property set to activeStep variable defined above.
              activeStep: activeStep,

              // This ensures step-tapping updates the activeStep.
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            header(),
            Expanded(
              child: FittedBox(
                child: Center(
                  child: Text('$activeStep'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(),
                nextButton(),
              ],
            ),
          ],
        ),
      ),

    );
  }

/// Returns the next button.
Widget nextButton() {
  return ElevatedButton(
    onPressed: () {
      // Increment activeStep, when the next button is tapped. However, check for upper bound.
      if (activeStep < upperBound) {
        setState(() {
          activeStep++;
        });
      }
    },
    child: Text('Next'),
  );
}

/// Returns the previous button.
Widget previousButton() {
  return ElevatedButton(
    onPressed: () {
      // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
      if (activeStep > 0) {
        setState(() {
          activeStep--;
        });
      }
    },
    child: Text('Prev'),
  );
}

/// Returns the header wrapping the header text.
Widget header() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            headerText(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}

String headerText() {
  switch (activeStep) {
    case 1:
      return 'Preface';

    case 2:
      return 'Table of Contents';

    case 3:
      return 'About the Author';

    case 4:
      return 'Publisher Information';

    case 5:
      return 'Reviews';

    case 6:
      return 'Chapters #1';

    default:
      return 'Introduction';
  }
}
}