import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:bdc/widgets/custom_drop_down.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Future<Map<String, dynamic>> signupUser() async {
    final response =
        await http.post(Uri.parse('http://192.168.1.2:4444/api/register/'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              // Add other headers if needed
            },
            body: jsonEncode(
              {
                'phone_number': phoneNumberController.text.toString(),
                'password': passwordController.text.toString(),
                'name': nameController.text.toString(),
                'email': emailController.text.toString(),
                'date_of_birth': dateOfBirthController.text.toString(),
                'bloodgroup': bloodgrp.toString(),
                'province_number': provinceNumberController.text.toString(),
                'address': addressController.text.toString(),
                'issue': issueController.text.toString(),
                // 'latitude': latController.text.toString(),
                // 'longitude': longController.text.toString(),
                //'profimg':_image1.toString(),
                //'docimg':_image2,
              },
            ));
    print('${response.body}');
    print('${response.statusCode}');
    // final storage = new FlutterSecureStorage();

    if (response.statusCode == 201) {
      // Successful login, parse the response
      final Map<String, dynamic> data = json.decode(response.body);
      var token = data['token']['access'];
      print("$token");

      // await storage.write(key: data['key'], value: data['value']);
      Navigator.pushNamed(context, '/verified');

      return data;
    } else {
      // Handle login failure
      throw Exception('Failed to login');
    }
  }

  List<String> dropdownItemList2 = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];

  TextEditingController nameController = TextEditingController();
  // TextEditingController latController = TextEditingController();
  // TextEditingController longController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController provinceNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController issueController = TextEditingController();
  var bloodgrp;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(height: 49.v),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 22.h, right: 15.h, bottom: 58.v),
                          child: Column(children: [
                            Text("Sign Up",
                                style: CustomTextStyles.headlineSmallPrimary),
                            SizedBox(height: 38.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 7.h),
                                    child: Text("Please register below",
                                        style: CustomTextStyles
                                            .bodyMediumSegoeUIBluegray900))),
                            SizedBox(height: 16.v),
                            _buildName(context),
                            SizedBox(height: 13.v),
                            _buildEmail(context),
                            SizedBox(height: 13.v),
                            _buildPassword(context),
                            SizedBox(height: 13.v),
                            _buildDateOfBirth(context),
                            SizedBox(height: 13.v),
                            _buildPhoneNumber(context),
                            SizedBox(height: 13.v),
                            Padding(
                                padding: EdgeInsets.only(right: 7.h),
                                child: CustomDropDown(
                                    icon: Container(
                                        child: CustomImageView(
                                            height: 9.v, width: 18.h)),
                                    hintText: "Blood Group",
                                    autofocus: false,
                                    items: dropdownItemList2,
                                    onChanged: (value) {
                                      bloodgrp = value;
                                    })),
                            SizedBox(
                              height: 13,
                            ),
                            _buildProvinceNumber(context),
                            SizedBox(height: 13.v),
                            _buildAddress(context),
                            // SizedBox(height: 13.v),
                            // _buildLatitude(context),
                            // SizedBox(height: 13.v),
                            // _buildLongitude(context),
                            SizedBox(height: 18.v),
                            Text("Any medical issue? If any State below.",
                                style: CustomTextStyles.bodyMediumPrimary_1),
                            SizedBox(height: 13.v),
                            _buildIssue(context),
                            SizedBox(height: 26.v),
                            CustomElevatedButton(
                                onPressed: signupUser,
                                text: "Sign Up",
                                margin: EdgeInsets.only(left: 7.h),
                                buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                                buttonTextStyle: CustomTextStyles
                                    .titleSmallRobotoOnPrimary_1),
                            SizedBox(height: 37.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 31.h, right: 33.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Already have an account?",
                                          style: CustomTextStyles
                                              .bodyMediumBlack900_1),
                                      GestureDetector(
                                          onTap: () {
                                            onTapTxtLogIn(context);
                                          },
                                          child: Text("Log In",
                                              style: CustomTextStyles
                                                  .titleSmallPrimary_1))
                                    ]))
                          ]))))
            ])));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child:
            CustomTextFormField(controller: nameController, hintText: "Name"));
  }

  // Widget _buildLatitude(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(right: 7.h),
  //       child: CustomTextFormField(
  //           textInputType: TextInputType.number,
  //           controller: latController,
  //           hintText: "Latitude(Optional)"));
  // }

  // Widget _buildLongitude(BuildContext context) {
  //   return Padding(
  //       padding: EdgeInsets.only(right: 7.h),
  //       child: CustomTextFormField(
  //           textInputType: TextInputType.number,
  //           controller: latController,
  //           hintText: "Longitude(Optional)"));
  // }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            controller: emailController,
            hintText: "Email",
            textInputType: TextInputType.emailAddress));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    // bool _editable = false;
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
          controller: passwordController,
          hintText: "Password",
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          // suffix: IconButton(
          //   icon: Icon(Icons.remove_red_eye),
          //   onPressed: () {},
          // ),
        ));
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            controller: dateOfBirthController,
            hintText: "Date of Birth (YY-MM-DD)"));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            controller: phoneNumberController,
            hintText: "Phone Number",
            textInputType: TextInputType.phone));
  }

  /// Section Widget
  Widget _buildProvinceNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            controller: provinceNumberController,
            hintText: "Province Number",
            textInputType: TextInputType.number,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL20,
            filled: true,
            fillColor: theme.colorScheme.onPrimary));
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            controller: addressController,
            hintText: "Address ( City, District )",
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL20,
            filled: true,
            fillColor: theme.colorScheme.onPrimary));
  }

  /// Section Widget
  Widget _buildIssue(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            controller: issueController,
            hintText: "Issue(Optional)",
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineBlackTL25));
  }
}

/// Navigates to the logInScreen when the action is triggered.
onTapTxtLogIn(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.logInScreen);
}
