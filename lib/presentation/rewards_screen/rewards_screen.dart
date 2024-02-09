import 'package:bdc/core/app_export.dart';
import 'package:bdc/presentation/rewards_screen/navigation.dart';
import 'package:bdc/presentation/rewards_screen/redeemed_rewards.dart';
import 'package:flutter/material.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    RewardsScreen(),
    RedeemedRewards(),
  ];
  void _navigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
        backgroundColor: Colors.red[800],
        elevation: 0,
      ),
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          height: 200,
          width: double.maxFinite,
          child: Text(''),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(130)),
            color: Colors.red[800],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120, left: 35),
          child: Container(
            height: 150,
            width: 320,
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
            child: Stack(
              children: [
                Container(
                  height: 130,
                  width: double.maxFinite,
                  child: Text(''),
                  decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(250, 60),
                          bottomLeft: Radius.elliptical(60, 90))),
                ),
                Container(
                  height: 110,
                  width: double.maxFinite,
                  child: Row(
                    children: [],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.elliptical(250, 60),
                          bottomLeft: Radius.elliptical(50, 70))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 34.0, top: 5, bottom: 5),
                  child: Text(
                    'PRAHLAD NEUPANE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Blood Group',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          Text('B+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('      No. of \n Successful \n Donations',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          Text('3',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 300.0, left: 20, right: 20, bottom: 30),
          child: Container(
            width: double.maxFinite,
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
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:  EdgeInsets.only(bottom:15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Redeemable items',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 30.0,bottom: 5,right:30),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
                  ],

                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(

                    leading: Image.asset('assets/images/movie.jpg'),
                    title: Text('Movie Tickets'),
                    subtitle: Text('Successful Donations: 5'),
                    trailing: IconButton(icon: Icon(Icons.redeem),
                        onPressed: (){}),
                  ),
                ),
              ),
          ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 30.0,bottom: 5,right:30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                        ],

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(

                          leading: Image.asset('assets/images/mug.png'),
                          title: Text('Cup'),
                          subtitle: Text('Successful Donations: 5'),
                          trailing: IconButton(icon: Icon(Icons.redeem),
                              onPressed: (){}),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 30.0,bottom: 5,right:30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                        ],

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(

                          leading: Image.asset('assets/images/white1.jpg'),
                          title: Text('T-Shirts'),
                          subtitle: Text('Successful Donations: 5'),
                          trailing: IconButton(icon: Icon(Icons.redeem),
                              onPressed: (){}),
                        ),
                      ),
                    ),
                  ),

                ]
                ,
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
