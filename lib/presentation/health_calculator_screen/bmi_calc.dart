import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchesController = TextEditingController();
  TextEditingController metersController = TextEditingController();
  String selectedUnit = 'Meters'; // Default unit

  double bmiResult = 0.0;
  String resultText = "";

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = 0.0;

    if (selectedUnit == 'Feet') {
      double feet = double.tryParse(feetController.text) ?? 0.0;
      double inches = double.tryParse(inchesController.text) ?? 0.0;
      height =
          feet * 0.3048 + inches * 0.0254; // Convert feet and inches to meters
    } else {
      height = double.tryParse(metersController.text) ?? 0.0;
    }

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        bmiResult = bmi;
        resultText = _getBMIResult(bmi);
      });
    }
  }

  String _getBMIResult(double bmi) {
    if (bmi < 16) {
      return "Extremely Underweight";
    } else if (bmi >= 16 && bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal";
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return "Overweight";
    } else if (bmi >= 30 && bmi < 35) {
      return "Obese Class One";
    } else if (bmi >= 35.1 && bmi < 40) {
      return "Obese Class Two";
    } else {
      return "Morbidly Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[800],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 0, left: 16.0, right: 16, bottom: 10),
            child: Column(
              children: [
                SizedBox(height: 40),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter Weight (kg)'),
                ),
                SizedBox(height: 20),
                if (selectedUnit == 'Feet')
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: feetController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Enter Height (Feet)',
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: inchesController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Enter Height (Inches)',
                          ),
                        ),
                      ),
                    ],
                  ),
                if (selectedUnit == 'Meters')
                  TextField(
                    controller: metersController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter Height (Meters)',
                    ),
                  ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: selectedUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUnit = newValue!;
                    });
                  },
                  items: <String>['Meters', 'Feet']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[800],
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 30, top: 30),
                  ),
                  child: Text('Calculate BMI',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                Text(
                  'BMI Result: ${bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Result: $resultText',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Image.asset('assets/images/bmichart.jpg')
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
