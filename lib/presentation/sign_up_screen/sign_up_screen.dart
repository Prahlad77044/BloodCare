import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:bdc/widgets/custom_drop_down.dart';

import 'dart:async';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatefulWidget {
  var latitude;
  var longitude;
  SignUpScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;
  bool _isPasswordHidden = true;

  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future signupUser() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
          Uri.parse('http://192.168.1.7:4444/api/user/register/'),
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

        // await storage.write(key: data['key'], value: data['value']);
        Navigator.pushNamed(context, '/verified');

        return data;
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        String errorMessage = errorData['detail'] ?? 'Failed to sign up';

        // Display the error message to the user
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign-Up Failed'),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Handle login failure
        throw Exception('Failed to signup');
      }
    } catch (error) {
      print('Error: $error');

      // Display a generic error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('$error'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
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
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();

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
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Blood Group is required';
                                    }
                                    // Add additional email validation if needed
                                    return null;
                                  },
                                )),
                            SizedBox(
                              height: 13,
                            ),
                            _buildProvinceNumber(context),
                            SizedBox(height: 13.v),
                            _buildAddress(context),
                            SizedBox(height: 18.v),
                            Text("Any medical issue? If any State below.",
                                style: CustomTextStyles.bodyMediumPrimary_1),
                            SizedBox(height: 13.v),
                            _buildIssue(context),
                            SizedBox(height: 26.v),
                            CustomElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    signupUser();
                                  }
                                },
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
        child: CustomTextFormField(
          controller: nameController,
          hintText: "Name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Name is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
  }



  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
          controller: emailController,
          hintText: "Email",
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    // bool _editable = false;
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
          autofocus: false,
          controller: passwordController,
          hintText: "Password",
          textInputType: TextInputType.visiblePassword,
          obscureText: _isPasswordHidden,
          suffix: IconButton(
            icon: Icon(
                _isPasswordHidden ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isPasswordHidden = !_isPasswordHidden;
              });
            },
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
          controller: dateOfBirthController,
          hintText: "Date of Birth (YY-MM-DD)",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Date of Birth is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
          controller: phoneNumberController,
          hintText: "Phone Number",
          textInputType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone Number is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
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
          fillColor: theme.colorScheme.onPrimary,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Province No. is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
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
          fillColor: theme.colorScheme.onPrimary,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Address is required';
            }
            // Add additional email validation if needed
            return null;
          },
        ));
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
