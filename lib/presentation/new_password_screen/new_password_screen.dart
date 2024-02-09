import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:bdc/presentation/succesful_acc_recover_dialog/succesful_acc_recover_dialog.dart';

// ignore_for_file: must_be_immutable
class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordController1 = TextEditingController();

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
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 41.h, vertical: 44.v),
                        decoration: AppDecoration.fillOnPrimary,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Text("Forgot Password",
                                      style: CustomTextStyles
                                          .headlineSmallPrimary)),
                              SizedBox(height: 67.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 40.h),
                                  child: Text("Enter the new password",
                                      style: CustomTextStyles
                                          .titleMediumBlack900)),
                              SizedBox(height: 17.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 26.h, right: 40.h),
                                  child: CustomTextFormField(
                                      controller: newpasswordController,
                                      hintText: "new password",
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 22.h, vertical: 14.v),
                                      borderDecoration: TextFormFieldStyleHelper
                                          .outlineBlackTL25)),
                              SizedBox(height: 27.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 26.h),
                                  child: Text("Re Enter the new password",
                                      style: CustomTextStyles
                                          .titleMediumBlack900)),
                              SizedBox(height: 16.v),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 26.h, right: 40.h),
                                  child: CustomTextFormField(
                                      controller: newpasswordController1,
                                      hintText: "new password",
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      borderDecoration: TextFormFieldStyleHelper
                                          .outlineBlackTL25)),
                              SizedBox(height: 38.v),
                              CustomElevatedButton(
                                  text: "Continue",
                                  margin: EdgeInsets.only(left: 5.h),
                                  buttonStyle:
                                      CustomButtonStyles.fillSecondaryContainer,
                                  buttonTextStyle: CustomTextStyles
                                      .titleSmallRobotoOnPrimary_1,
                                  onPressed: () {
                                    onTapContinue(context);
                                  }),
                              SizedBox(height: 38.v)
                            ]))))));
  }

  /// Displays a dialog with the [SuccesfulAccRecoverDialog] content.
  onTapContinue(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: SuccesfulAccRecoverDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
