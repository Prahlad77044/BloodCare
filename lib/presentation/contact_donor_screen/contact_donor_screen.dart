import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class ContactDonorScreen extends StatelessWidget {
  const ContactDonorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
           appBar: AppBar(
             title: Text('Donor\'s List'),
             backgroundColor: Colors.red[800],
           ),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 771.v,
                        width: double.maxFinite,
                        child:
                            Stack(alignment: Alignment.bottomLeft, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  decoration: AppDecoration.fillPrimary,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 32.h),
                                            child: Text(
                                                "select from the list of donors to contact",
                                                style: theme
                                                    .textTheme.labelLarge)),
                                        SizedBox(height: 17.v),
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 28.h,
                                                vertical: 32.v),
                                            decoration: AppDecoration
                                                .fillOnPrimary
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .customBorderTL30),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 4.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall1(context),
                                                  SizedBox(height: 27.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall3(context),
                                                  SizedBox(height: 13.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall5(context),
                                                  SizedBox(height: 27.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall7(context),
                                                  SizedBox(height: 32.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall9(context),
                                                  SizedBox(height: 27.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall11(context),
                                                  SizedBox(height: 22.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall)),
                                                  SizedBox(height: 13.v),
                                                  _buildCall13(context),
                                                  SizedBox(height: 27.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("Wunmi Tunde",
                                                          style: theme.textTheme
                                                              .titleSmall))
                                                ]))
                                      ]))),
                          _buildCall14(context),
                          _buildMessage7(context)
                        ]))))));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildCall(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v, text: "Call", margin: EdgeInsets.only(right: 19.h)));
  }

  /// Section Widget
  Widget _buildMessage(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Message", margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall(context), _buildMessage(context)]));
  }

  /// Section Widget
  Widget _buildCall2(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Call",
            margin: EdgeInsets.only(right: 19.h),
            buttonTextStyle: CustomTextStyles.labelLargePrimary));
  }

  /// Section Widget
  Widget _buildMessage1(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v,
            text: "Message",
            margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall2(context), _buildMessage1(context)]));
  }

  /// Section Widget
  Widget _buildCall4(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v, text: "Call", margin: EdgeInsets.only(right: 19.h)));
  }

  /// Section Widget
  Widget _buildMessage2(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Message", margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall5(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall4(context), _buildMessage2(context)]));
  }

  /// Section Widget
  Widget _buildCall6(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v, text: "Call", margin: EdgeInsets.only(right: 19.h)));
  }

  /// Section Widget
  Widget _buildMessage3(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Message", margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall7(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall6(context), _buildMessage3(context)]));
  }

  /// Section Widget
  Widget _buildCall8(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v, text: "Call", margin: EdgeInsets.only(right: 19.h)));
  }

  /// Section Widget
  Widget _buildMessage4(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Message", margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall9(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall8(context), _buildMessage4(context)]));
  }

  /// Section Widget
  Widget _buildCall10(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Call",
            margin: EdgeInsets.only(right: 19.h),
            buttonTextStyle: CustomTextStyles.labelLargePrimary));
  }

  /// Section Widget
  Widget _buildMessage5(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v,
            text: "Message",
            margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall11(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall10(context), _buildMessage5(context)]));
  }

  /// Section Widget
  Widget _buildCall12(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            height: 34.v, text: "Call", margin: EdgeInsets.only(right: 19.h)));
  }

  /// Section Widget
  Widget _buildMessage6(BuildContext context) {
    return Expanded(
        child: CustomOutlinedButton(
            text: "Message", margin: EdgeInsets.only(left: 19.h)));
  }

  /// Section Widget
  Widget _buildCall13(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_buildCall12(context), _buildMessage6(context)]));
  }

  /// Section Widget
  Widget _buildCall14(BuildContext context) {
    return CustomOutlinedButton(
        width: 138.h,
        text: "Call",
        margin: EdgeInsets.only(left: 28.h),
        buttonTextStyle: CustomTextStyles.labelLargePrimary,
        alignment: Alignment.bottomLeft);
  }

  /// Section Widget
  Widget _buildMessage7(BuildContext context) {
    return CustomElevatedButton(
        height: 34.v,
        width: 138.h,
        text: "Message",
        margin: EdgeInsets.only(right: 33.h),
        alignment: Alignment.bottomRight);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
