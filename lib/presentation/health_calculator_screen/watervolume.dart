import 'package:flutter/material.dart';

class WaterVolumeCalculator extends StatefulWidget {
  @override
  _WaterVolumeCalculatorState createState() => _WaterVolumeCalculatorState();
}

class _WaterVolumeCalculatorState extends State<WaterVolumeCalculator> {
  TextEditingController weightController = TextEditingController();
  String gender = 'Male';
  double waterVolume = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Volume Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter your weight (kg)'),
            ),
            SizedBox(height: 16.0),
            Text('Select your gender:'),
            Row(
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateWaterVolume();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Water Volume in Your Body: $waterVolume liters',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  void calculateWaterVolume() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double waterPercentage = gender == 'Male' ? 0.60 : 0.55;
    waterVolume = weight * waterPercentage;
    setState(() {});
  }
}
