import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isLoading = false;
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future loginUser() async {
    try {
      setState(() {
        _isLoading = true;
        CircularProgressIndicator.adaptive();
      });

      final response = await http.post(
          Uri.parse('http://192.168.159.163:4444/api/user/login/'),
          headers: <String, String>{
            'Content-Type': 'application/json',

            // Add other headers if needed
          },
          body: jsonEncode(
            {
              'phone_number': phoneNumberController.text.toString(),
              'password': passwordController.text.toString(),
            },
          ));
      print('${response.body}');
      print('${response.statusCode}');

      if (response.statusCode == 200) {
        // Successful login, parse the response
        final Map<String, dynamic> data = json.decode(response.body);
        var accessToken = data['token']['access'];
        var refreshToken = data['token']['refresh'];
        await secureStorage.write(key: 'access_token', value: '$accessToken');
        await secureStorage.write(key: 'refresh_token', value: '$refreshToken');
        Navigator.pushNamed(context, '/home_page_screen');

        return data;
      } else if (response.statusCode == 404) {
        final Map<String, dynamic> errorData = json.decode(response.body);
        String errorMessage = errorData['detail']['error'];

        // Display the error message to the user
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
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
        throw Exception('Phone Number or password not valid.');
      }
    } catch (error) {
      print('Error: $error[]');
      // Display a generic error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Login Failed',
              style: TextStyle(
                  color: Colors.red[800], fontWeight: FontWeight.bold),
            ),
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

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 22.h, vertical: 36.v),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              child: Image.asset(
                            'assets/images/blood.png',
                            height: 130,
                          )),
                          SizedBox(height: 16.v),
                          Text("Welcome!!!",
                              style: CustomTextStyles.headlineSmallPrimary),
                          SizedBox(height: 37.v),
                          CustomTextFormField(
                              controller: phoneNumberController,
                              hintText: "Phone Number",
                              textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              autofocus: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone Number is required';
                                }
                                // Add additional email validation if needed
                                return null;
                              },
                              textInputType: TextInputType.phone,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 21.v),
                              borderDecoration:
                                  TextFormFieldStyleHelper.outlineBlackTL25),
                          SizedBox(height: 28.v),
                          CustomTextFormField(
                              controller: passwordController,
                              hintText: "Password",
                              autofocus: false,
                              textStyle: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: obscure,
                              suffix: IconButton(
                                icon: Icon(obscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 21.v),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                // Add additional email validation if needed
                                return null;
                              },
                              borderDecoration:
                                  TextFormFieldStyleHelper.outlineBlackTL25),
                          SizedBox(height: 19.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/forgot_password_screen');
                                  },
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 15.h),
                                      child: Text(
                                        "Forget password",
                                        style: TextStyle(
                                            color: Colors.red[800],
                                            fontSize: 13),
                                      )))),
                          SizedBox(height: 56.v),
                          CustomElevatedButton(
                              text: "Log In",
                              buttonStyle:
                                  CustomButtonStyles.fillSecondaryContainer,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallRobotoOnPrimary_1,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  loginUser();
                                }
                              }),
                          Spacer(),
                          SizedBox(height: 3.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 45.h),
                                  child: Row(children: [
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 1.v),
                                        child: Text("Don’t have an account?",
                                            style: CustomTextStyles
                                                .bodyMediumBlack900_1)),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtSignUp(context);
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text("Sign Up",
                                                style: CustomTextStyles
                                                    .titleSmallPrimary_1)))
                                  ])))
                        ])))));
  }

  /// Navigates to the stStepOfNewPasswordScreen when the action is triggered.
  onTapTxtForgetPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.stStepOfNewPasswordScreen);
  }

  /// Navigates to the homePageScreen when the action is triggered.

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }
}
