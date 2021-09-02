import 'package:flutter/material.dart';
import 'package:powers/powers.dart';

import 'package:bmi_calculator/Widgets/leftbar.dart';
import 'package:bmi_calculator/Widgets/rightbar.dart';
import 'package:bmi_calculator/constants/constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController _heightEditingController = TextEditingController();
  TextEditingController _massEditingController = TextEditingController();
  double bmi = 0;
  String conclusion = '';
  //function to calculate BMI
  void calculateBmi() {
    double height = double.parse(_heightEditingController.text);
    double mass = double.parse(_massEditingController.text);
    double _bmi = mass / (height.squared());
    print('_bmi = $_bmi');

    setState(() {
      bmi = _bmi;
    });
    print('bmi = $bmi');
    print('bmi to string: ${bmi.toStringAsFixed(2)}');
    if (bmi < 18.5) {
      setState(() {
        conclusion = 'Underweight';
      });
    } else if (bmi > 25) {
      setState(() {
        conclusion = 'Overweight';
      });
    } else {
      setState(() {
        conclusion = 'Normal Weight';
      });
    }
    print('conclusion: $conclusion');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
              color: accentHexColor, fontSize: 15, fontWeight: FontWeight.w400),
        ),
        backgroundColor: mainHexColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: size.width * 0.4,
                    child: TextField(
                      controller: _heightEditingController,
                      style: TextStyle(color: accentHexColor, fontSize: 30),
                      decoration: InputDecoration(
                        hintText: 'Height',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: size.width * 0.4,
                    child: TextField(
                      controller: _massEditingController,
                      style: TextStyle(color: accentHexColor, fontSize: 30),
                      decoration: InputDecoration(
                        hintText: 'Mass',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: size.width * 0.6,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainHexColor,
                  elevation: 5,
                  shadowColor: accentHexColor,
                ),
                onPressed: () => calculateBmi(),
                child: Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        color: accentHexColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                bmi.toStringAsFixed(2),
                style: TextStyle(
                    color: accentHexColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 60),
              ),
            ),
            SizedBox(height: 20),
            Visibility(
              visible: true,
              child: Center(
                child: Text(
                  conclusion,
                  style: TextStyle(
                      color: accentHexColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [RightBar(barWidth: 30)],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [RightBar(barWidth: 60)],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [RightBar(barWidth: 30)],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [LeftBar(barWidth: 30)],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [LeftBar(barWidth: 30)],
            ),
          ],
        ),
      ),
    );
  }
}
