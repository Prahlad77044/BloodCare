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
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<Map<String, dynamic>> loginUser() async {
    final response =
        await http.post(Uri.parse('http://192.168.1.2:4444/api/login/'),
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
      Navigator.pushNamed(context, '/home_page_screen');
      var accessToken = data['token']['access'];
      var refreshToken = data['token']['refresh'];
      await secureStorage.write(key: 'access_token', value: '$accessToken');
      await secureStorage.write(key: 'refresh_token', value: '$refreshToken');

      print('$refreshToken');
      print('$accessToken');

      return data;
    } else {
      // Handle login failure
      throw Exception('error');
    }
  }

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                              autofocus: false,
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
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 11.h, vertical: 21.v),
                              validator: (value) {
                                if (value == null || value.isEmpty) {}
                              },
                              borderDecoration:
                                  TextFormFieldStyleHelper.outlineBlackTL25),
                          SizedBox(height: 19.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: loginUser,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 15.h),
                                      child: Text("forget password",
                                          style: CustomTextStyles
                                              .bodyMediumGray800)))),
                          SizedBox(height: 56.v),
                          CustomElevatedButton(
                              text: "Log In",
                              buttonStyle:
                                  CustomButtonStyles.fillSecondaryContainer,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallRobotoOnPrimary_1,
                              onPressed: () {
                                loginUser();
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
