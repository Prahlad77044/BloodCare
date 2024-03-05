import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController ourcontroller = TextEditingController();
  Future<void> sendResetEmail(BuildContext context) async {
    final String email = ourcontroller.text.trim();

    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.4:4444/api/user/send-reset-password-otp/'),
        body: {'email': email},
      );

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/new_password_screen');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send reset email')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 38.h, vertical: 51.v),
                    decoration: AppDecoration.fillOnPrimary,
                    child: Column(children: [
                      Text(
                        "Forgot Password",
                        style: CustomTextStyles.headlineSmallPrimary,
                      ),
                      SizedBox(height: 70.v),
                      Container(
                          width: 242.h,
                          margin: EdgeInsets.only(left: 35.h, right: 21.h),
                          child: Text(
                              "Please enter you email associated with the account.",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleMediumBlack900)),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextField(
                          controller: ourcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                          ),
                        ),
                      ),
                      SizedBox(height: 71.v),
                      CustomElevatedButton(
                          text: "Continue",
                          margin: EdgeInsets.only(left: 11.h),
                          buttonStyle:
                              CustomButtonStyles.fillSecondaryContainer,
                          buttonTextStyle:
                              CustomTextStyles.titleSmallRobotoOnPrimary_1,
                          onPressed: () {
                            sendResetEmail(context);
                          }),
                    ])))));
  }

  /// Navigates to the newPasswordScreen when the action is triggered.
}
