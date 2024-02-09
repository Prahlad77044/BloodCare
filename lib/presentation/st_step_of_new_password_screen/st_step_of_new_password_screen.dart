import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class StStepOfNewPasswordScreen extends StatelessWidget {
  StStepOfNewPasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 23.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  margin: EdgeInsets.only(right: 11.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 33.h, vertical: 50.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text("Forgot Password",
                                                style: CustomTextStyles
                                                    .headlineSmallPrimary)),
                                        SizedBox(height: 52.v),
                                        Container(
                                            width: 222.h,
                                            margin: EdgeInsets.only(
                                                left: 14.h, right: 61.h),
                                            child: Text(
                                                "Enter the email associated with the account.",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .titleMediumBlack900)),
                                        SizedBox(height: 42.v),
                                        Container(
                                            width: 235.h,
                                            margin: EdgeInsets.only(
                                                left: 13.h, right: 48.h),
                                            child: Text(
                                                "We will send you email with verification code. ",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .titleMediumBlack900)),
                                        SizedBox(height: 50.v),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 17.h, right: 37.h),
                                            child: CustomTextFormField(
                                                controller: emailController,
                                                hintText: "email",
                                                textInputAction:
                                                    TextInputAction.done,
                                                textInputType:
                                                    TextInputType.emailAddress,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16.h,
                                                        vertical: 15.v),
                                                borderDecoration:
                                                    TextFormFieldStyleHelper
                                                        .outlineBlackTL25)),
                                        SizedBox(height: 49.v),
                                        CustomElevatedButton(
                                            text: "Continue",
                                            margin: EdgeInsets.only(left: 10.h),
                                            buttonStyle: CustomButtonStyles
                                                .fillSecondaryContainer,
                                            buttonTextStyle: CustomTextStyles
                                                .titleSmallRobotoOnPrimary_1,
                                            onPressed: () {
                                              onTapContinue(context);
                                            }),
                                        SizedBox(height: 49.v)
                                      ]))))
                    ])))));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }
}
