import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppointmentPageThreePage extends StatefulWidget {
  const AppointmentPageThreePage({Key? key})
      : super(
          key: key,
        );

  @override
  AppointmentPageThreePageState createState() =>
      AppointmentPageThreePageState();
}

class AppointmentPageThreePageState extends State<AppointmentPageThreePage>
    with AutomaticKeepAliveClientMixin<AppointmentPageThreePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 22.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 35.h,
                    right: 63.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDate(
                        context,
                        date: "Date ",
                        threeThousandThreeHundredTwent: "3/3/21",
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: _buildTime(
                          context,
                          time: "Time",
                          time1: "14 : 17 PM",
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: _buildAddress(
                          context,
                          address: "Address",
                          abiolaWayAkure: "1, Abiola Way, Akure",
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(right: 75.h),
                        child: _buildLocation(
                          context,
                          location: "Location",
                          generalHospital: "General Hospital, Barracks",
                        ),
                      ),
                      SizedBox(height: 6.v),
                      _buildDonationSuccessful(context),
                      SizedBox(height: 23.v),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: _buildDate(
                          context,
                          date: "Date ",
                          threeThousandThreeHundredTwent: "3/3/21",
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildTime(
                          context,
                          time: "Time",
                          time1: "14 : 17 PM",
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildAddress(
                          context,
                          address: "Address",
                          abiolaWayAkure: "1, Abiola Way, Akure",
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.h,
                          right: 71.h,
                        ),
                        child: _buildLocation(
                          context,
                          location: "Location",
                          generalHospital: "General Hospital, Barracks",
                        ),
                      ),
                      SizedBox(height: 5.v),
                      _buildDonationSuccesful(context),
                      SizedBox(height: 21.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildDate(
                          context,
                          date: "Date ",
                          threeThousandThreeHundredTwent: "3/3/21",
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildTime(
                          context,
                          time: "Time",
                          time1: "14 : 17 PM",
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildAddress(
                          context,
                          address: "Address",
                          abiolaWayAkure: "1, Abiola Way, Akure",
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.h,
                          right: 70.h,
                        ),
                        child: _buildLocation(
                          context,
                          location: "Location",
                          generalHospital: "General Hospital, Barracks",
                        ),
                      ),
                      SizedBox(height: 5.v),
                      _buildDonationUnsuccesful(context),
                      SizedBox(height: 32.v),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: _buildDate(
                          context,
                          date: "Date ",
                          threeThousandThreeHundredTwent: "3/3/21",
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildTime(
                          context,
                          time: "Time",
                          time1: "14 : 17 PM",
                        ),
                      ),
                      SizedBox(height: 11.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: _buildAddress(
                          context,
                          address: "Address",
                          abiolaWayAkure: "1, Abiola Way, Akure",
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.h,
                          right: 71.h,
                        ),
                        child: _buildLocation(
                          context,
                          location: "Location",
                          generalHospital: "General Hospital, Barracks",
                        ),
                      ),
                      SizedBox(height: 5.v),
                      _buildDonationUnsuccesful1(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDonationSuccessful(BuildContext context) {
    return CustomElevatedButton(
      height: 38.v,
      text: "Donation Successful",
      margin: EdgeInsets.only(
        left: 29.h,
        right: 1.h,
      ),
      buttonStyle: CustomButtonStyles.fillGreenA,
      buttonTextStyle: theme.textTheme.labelMedium!,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildDonationSuccesful(BuildContext context) {
    return CustomElevatedButton(
      height: 38.v,
      text: "Donation Succesful",
      margin: EdgeInsets.only(
        left: 29.h,
        right: 1.h,
      ),
      buttonStyle: CustomButtonStyles.fillGreenA,
      buttonTextStyle: theme.textTheme.labelMedium!,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildDonationUnsuccesful(BuildContext context) {
    return CustomElevatedButton(
      height: 38.v,
      text: "Donation Unsuccesful",
      margin: EdgeInsets.only(left: 29.h),
      buttonStyle: CustomButtonStyles.fillDeepOrange,
      buttonTextStyle: theme.textTheme.labelMedium!,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildDonationUnsuccesful1(BuildContext context) {
    return CustomElevatedButton(
      height: 38.v,
      text: "Donation Unsuccesful",
      margin: EdgeInsets.only(
        left: 29.h,
        right: 1.h,
      ),
      buttonStyle: CustomButtonStyles.fillDeepOrange,
      buttonTextStyle: theme.textTheme.labelMedium!,
      alignment: Alignment.centerRight,
    );
  }

  /// Common widget
  Widget _buildDate(
    BuildContext context, {
    required String date,
    required String threeThousandThreeHundredTwent,
  }) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 2.v,
            bottom: 1.v,
          ),
          child: Text(
            date,
            style: CustomTextStyles.bodySmallGray800.copyWith(
              color: appTheme.gray800,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 22.h),
          child: Text(
            threeThousandThreeHundredTwent,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.gray900,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildTime(
    BuildContext context, {
    required String time,
    required String time1,
  }) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 1.v,
            bottom: 2.v,
          ),
          child: Text(
            time,
            style: CustomTextStyles.bodySmallGray800.copyWith(
              color: appTheme.gray800,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 19.h),
          child: Text(
            time1,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.gray900,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildAddress(
    BuildContext context, {
    required String address,
    required String abiolaWayAkure,
  }) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 1.v,
            bottom: 2.v,
          ),
          child: Text(
            address,
            style: CustomTextStyles.bodySmallGray800.copyWith(
              color: appTheme.gray800,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 7.h),
          child: Text(
            abiolaWayAkure,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.gray900,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildLocation(
    BuildContext context, {
    required String location,
    required String generalHospital,
  }) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 1.v,
            bottom: 2.v,
          ),
          child: Text(
            location,
            style: CustomTextStyles.bodySmallGray800.copyWith(
              color: appTheme.gray800,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: Text(
            generalHospital,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.gray900,
            ),
          ),
        ),
      ],
    );
  }
}
