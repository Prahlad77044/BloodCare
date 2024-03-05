import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:bdc/presentation/compatibility_chart_bottomsheet/compatibility_chart_bottomsheet.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  bool isverified = false;
  void showVerificationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Blood Group Verification',
            style:
                TextStyle(color: Colors.red[800], fontWeight: FontWeight.bold),
          ),
          content: Text(
              'Please upload your blood group verification document.You wont be able to donate blood until you are verified.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Skip for now'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the upload screen
                Navigator.pushNamed(context, '/upload_verification');
              },
              child: Text('Upload Now'),
            ),
          ],
        );
      },
    );
  }

  Future checkVerificationStatus() async {
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    // Call your backend API to check verification status
    String yourToken = "$accessToken";

    Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);
    print('$decodedToken');

    // Extract user ID from the decoded token
    var userid = decodedToken['user_id'];
    var response = await http.get(
      Uri.parse('http://192.168.1.4:4444/api/user/profile/$userid/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
    );
    print('${response.body}');

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      void showVerificationPopup() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Blood Group Verification',
                style: TextStyle(
                    color: Colors.red[800], fontWeight: FontWeight.bold),
              ),
              content: Text(
                  'Please upload your blood group verification document.You wont be able to donate blood until you are verified.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Skip for now'),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the upload screen
                    Navigator.pushNamed(context, '/upload_verification');
                  },
                  child: Text('Upload Now'),
                ),
              ],
            );
          },
        );
      }

      bool isVerified = responseData['is_verified'];
      setState(() {
        isverified = isVerified;
      });
      if (isVerified == false) {
        // Show the pop-up
        showVerificationPopup();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Check verification status when the home screen is loaded
    checkVerificationStatus();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    String greeting;
    if (hour < 12) {
      greeting = 'Good morning ';
    } else if (hour < 18) {
      greeting = 'Good afternoon';
    } else if (hour < 22) {
      greeting = 'Good evening';
    } else {
      greeting = 'Good night';
    }

    mediaQueryData = MediaQuery.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(''),
              backgroundColor: Colors.red[800],
              elevation: 0,
            ),
            drawer: Drawer(
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  DrawerHeader(
                      child: Image.asset(
                    'assets/images/blood.png',
                  )),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/home_page_screen');
                    },
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/bmi_calc');
                    },
                    leading: Icon(Icons.health_and_safety_outlined),
                    title: Text('Health Calculator'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/upload_verification');
                    },
                    leading: Icon(Icons.edit_document),
                    title: Text('Upload Document'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/donorsNearby');
                    },
                    leading: Icon(Icons.location_on_sharp),
                    title: Text('Donors Nearby'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/info_screen');
                    },
                    leading: Icon(Icons.info_outlined),
                    title: Text('Information'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/rewards_screen');
                    },
                    leading: Icon(Icons.card_giftcard_outlined),
                    title: Text('Rewards'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/customer_support');
                    },
                    leading: Icon(Icons.call),
                    title: Text('FeedBack'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/log_in_screen');
                    },
                    leading: Icon(Icons.logout),
                    title: Text('Log Out'),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
                SizedBox(
                    height: 451.v,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.bottomLeft, children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: 457.v,
                              width: 380.h,
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEllipse24,
                                        height: 467.v,
                                        width: 380.h,
                                        alignment: Alignment.center),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Container(
                                          height: 262.v,
                                          width: 301.h,
                                          child: Stack(
                                              alignment: Alignment.centerLeft,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgFreepikCharacter,
                                                    height: 235.v,
                                                    width: 97.h,
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    margin: EdgeInsets.only(
                                                        right: 4.h,
                                                        bottom: 19.v)),
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgFreepikCharacterGray400,
                                                    height: 262.v,
                                                    width: 232.h,
                                                    alignment:
                                                        Alignment.centerLeft)
                                              ])),
                                    )
                                  ]))),
                      GestureDetector(
                        onTap: () {
                          if (isverified == true) {
                            onTapSeventyTwo(context);
                          } else {
                            showVerificationPopup();
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.only(left: 34.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.h, vertical: 19.v),
                            decoration: AppDecoration.outlineBlack900.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant.imgFloatingIcon,
                                      height: 44.v,
                                      width: 34.h,
                                      margin: EdgeInsets.only(left: 7.h)),
                                  SizedBox(height: 10.v),
                                  Text("Donate",
                                      style:
                                          CustomTextStyles.bodyMediumBlack900),
                                  SizedBox(height: 7.v)
                                ])),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapSixtySev(context);
                              },
                              child: Container(
                                  margin:
                                      EdgeInsets.only(left: 240.h, right: 30.h),
                                  padding: EdgeInsets.only(
                                      top: 20.v, right: 28.h, bottom: 20.v),
                                  decoration: AppDecoration.outlineBlack900
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder5),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgSend,
                                            height: 46.adaptSize,
                                            width: 46.adaptSize,
                                            margin:
                                                EdgeInsets.only(left: 30.h)),
                                        SizedBox(height: 9.v),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text("Request",
                                                style: CustomTextStyles
                                                    .bodyMediumBlack900))
                                      ]))))
                    ])),
                SizedBox(height: 26.v),
                _buildMenu(context),
                SizedBox(height: 21.v),
                _buildLocation(context),
                SizedBox(height: 57.v)
              ])),
            )));
  }

  /// Section Widget
  Widget _buildMenu(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 33.h, right: 30.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                onTapSeventy(context);
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.h, vertical: 16.v),
                  decoration: AppDecoration.outlineBlack900
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 7.v),
                        CustomImageView(
                            imagePath: ImageConstant.imgMenu,
                            height: 43.v,
                            width: 38.h),
                        SizedBox(height: 16.v),
                        Text("Donor’s List",
                            style: CustomTextStyles.bodyMediumBlack900)
                      ]))),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile_screen');
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.h, vertical: 13.v),
                  decoration: AppDecoration.outlineBlack900
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5.v),
                        Icon(
                          Icons.account_circle_sharp,
                          color: Colors.red[800],
                          size: 55,
                        ),
                        SizedBox(height: 15.v),
                        Text("My Profile",
                            style: CustomTextStyles.bodyMediumGray900),
                        SizedBox(height: 2.v)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 33.h, right: 30.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              margin: EdgeInsets.only(left: 0.h),
              padding: EdgeInsets.fromLTRB(9.h, 4.v, 28.h, 2.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 14.v),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 43.v,
                          width: 28.h),
                    ),
                    SizedBox(height: 4.v),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                            width: 60.h,
                            child: Text("Plasma Donation Centres",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyMediumBlack900)),
                      ),
                    )
                  ])),
          GestureDetector(
              onTap: () {
                onTapSixtyNine(context);
              },
              child: Container(
                  margin: EdgeInsets.only(left: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 4.v),
                  decoration: AppDecoration.outlineBlack900
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 12.v),
                        Container(
                            height: 45.v,
                            margin: EdgeInsets.only(left: 20.h),
                            child:
                                Stack(alignment: Alignment.center, children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgMinimize,
                                  height: 44.adaptSize,
                                  width: 44.adaptSize,
                                  alignment: Alignment.center),
                              CustomImageView(
                                  imagePath: ImageConstant.imgMaximize,
                                  height: 54.v,
                                  width: 44.h,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 1.h))
                            ])),
                        SizedBox(height: 2.v),
                        Container(
                            width: 88.h,
                            margin: EdgeInsets.only(),
                            child: Text("Blood \nCompatibility\nChart",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles.bodyMediumBlack900))
                      ])))
        ]));
  }

  /// Navigates to the docRequestOneScreen when the action is triggered.
  onTapSixtySev(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.docRequestOneScreen);
  }

  /// Navigates to the donorListScreen when the action is triggered.
  onTapSeventy(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.donorListScreen);
  }

  /// Navigates to the historyScreen when the action is triggered.

  /// Navigates to the donateScreen when the action is triggered.
  onTapSeventyTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.donateFromHomeBottomsheet);
  }

  /// Shows a modal bottom sheet with [CompatibilityChartBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapSixtyNine(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => CompatibilityChartBottomsheet(),
        isScrollControlled: true);
  }
}
