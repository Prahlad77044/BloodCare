import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppointmentPageTwoBottomsheet extends StatelessWidget {
  AppointmentPageTwoBottomsheet({Key? key})
      : super(
          key: key,
        );

  TextEditingController editTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.fillOnPrimary.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.v,
                  width: 29.h,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "New",
                          style: CustomTextStyles.labelLargePrimary,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 2.v,
                          width: 19.h,
                          margin: EdgeInsets.only(left: 4.h),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 47,
                ),
                Text(
                  "Upcoming",
                  style: theme.textTheme.bodySmall,
                ),
                Spacer(
                  flex: 52,
                ),
                Text(
                  "Previous",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVectorGray500,
                height: 7.v,
                width: 5.h,
                margin: EdgeInsets.only(
                  top: 3.v,
                  bottom: 7.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.h),
                child: Text(
                  "May 2020",
                  style: CustomTextStyles.titleSmallGray900,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVectorGray5007x5,
                height: 7.v,
                width: 5.h,
                margin: EdgeInsets.only(
                  left: 23.h,
                  top: 3.v,
                  bottom: 7.v,
                ),
              ),
            ],
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sun ",
                  style: CustomTextStyles.labelLargeGray500,
                ),
                Text(
                  "Mon",
                  style: CustomTextStyles.labelLargeGray500,
                ),
                Text(
                  "Tue",
                  style: CustomTextStyles.labelLargeGray500,
                ),
                Text(
                  "Wed",
                  style: CustomTextStyles.labelLargePrimary,
                ),
                Text(
                  "Thur",
                  style: CustomTextStyles.labelLargeGray500,
                ),
                Text(
                  "Fri",
                  style: CustomTextStyles.labelLargeGray500,
                ),
                Text(
                  "Sat",
                  style: CustomTextStyles.labelLargeGray500,
                ),
              ],
            ),
          ),
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(
              left: 25.h,
              right: 21.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "14",
                  style: CustomTextStyles.bodySmallGray50011,
                ),
                Spacer(
                  flex: 19,
                ),
                Text(
                  "15",
                  style: CustomTextStyles.bodySmallGray50011,
                ),
                Spacer(
                  flex: 20,
                ),
                Text(
                  "16",
                  style: CustomTextStyles.bodySmallGray50011,
                ),
                Spacer(
                  flex: 20,
                ),
                Text(
                  "17",
                  style: CustomTextStyles.bodySmallPrimary,
                ),
                Spacer(
                  flex: 21,
                ),
                Text(
                  "18",
                  style: CustomTextStyles.bodySmallGray50011,
                ),
                Spacer(
                  flex: 17,
                ),
                Text(
                  "19",
                  style: CustomTextStyles.bodySmallGray50011,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28.h),
                  child: Text(
                    "20",
                    style: CustomTextStyles.bodySmallGray50011,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 22.h),
              child: Text(
                "Time",
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          _buildAM1(context),
          SizedBox(height: 34.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.h),
              child: Text(
                "Location",
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(height: 10.v),
          _buildEditText(context),
          SizedBox(height: 78.v),
          _buildConfirm(context),
          SizedBox(height: 78.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAM(BuildContext context) {
    return CustomElevatedButton(
      height: 60.v,
      width: 68.h,
      text: "AM",
      buttonStyle: CustomButtonStyles.fillPrimary1,
      buttonTextStyle: CustomTextStyles.titleLargeMedium,
    );
  }

  /// Section Widget
  Widget _buildPM(BuildContext context) {
    return CustomElevatedButton(
      height: 60.v,
      width: 68.h,
      text: "PM",
      buttonStyle: CustomButtonStyles.fillGrayA,
      buttonTextStyle: CustomTextStyles.titleLargeGray900,
    );
  }

  /// Section Widget
  Widget _buildAM1(BuildContext context) {
    return Container(
      decoration: AppDecoration.outlineBlack,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildAM(context),
          _buildPM(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return CustomTextFormField(
      controller: editTextController,
      textInputAction: TextInputAction.done,
      borderDecoration: TextFormFieldStyleHelper.outlineBlack1,
    );
  }

  /// Section Widget
  Widget _buildConfirm(BuildContext context) {
    return CustomElevatedButton(
      text: "Confirm",
      buttonStyle: CustomButtonStyles.fillPrimaryTL10,
      buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
    );
  }
}
