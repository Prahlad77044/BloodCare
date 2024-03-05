import 'package:flutter/material.dart';

class HealthCalculatorHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(
                        0,
                        0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.red,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 50,
                      color: Colors.lightBlue,
                    ),
                    Column(
                      children: [
                        Text('Body Water Volume'),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
