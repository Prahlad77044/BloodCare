import '../appointment_page_five_page/widgets/appointmentpagefive_item_widget.dart';
import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppointmentPageFivePage extends StatefulWidget {
  const AppointmentPageFivePage({Key? key})
      : super(
          key: key,
        );

  @override
  AppointmentPageFivePageState createState() => AppointmentPageFivePageState();
}

class AppointmentPageFivePageState extends State<AppointmentPageFivePage>
    with AutomaticKeepAliveClientMixin<AppointmentPageFivePage> {
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
              Padding(
                padding: EdgeInsets.only(
                  left: 31.h,
                  right: 25.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      padding: EdgeInsets.only(left: 4.h),
                      child: _buildLocation(
                        context,
                        location: "Location",
                        generalHospital: "General Hospital, Barracks",
                      ),
                    ),
                    SizedBox(height: 8.v),
                    _buildAppointmentPageFive(context),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: _buildDate(
                        context,
                        date: "Date ",
                        threeThousandThreeHundredTwent: "3/3/21",
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildTime(
                        context,
                        time: "Time",
                        time1: "14 : 17 PM",
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildAddress(
                        context,
                        address: "Address",
                        abiolaWayAkure: "1, Abiola Way, Akure",
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: _buildLocation(
                        context,
                        location: "Location",
                        generalHospital: "General Hospital, Barracks",
                      ),
                    ),
                    SizedBox(height: 64.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildDate(
                        context,
                        date: "Date ",
                        threeThousandThreeHundredTwent: "3/3/21",
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildTime(
                        context,
                        time: "Time",
                        time1: "14 : 17 PM",
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildAddress(
                        context,
                        address: "Address",
                        abiolaWayAkure: "1, Abiola Way, Akure",
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildLocation(
                        context,
                        location: "Location",
                        generalHospital: "General Hospital, Barracks",
                      ),
                    ),
                    SizedBox(height: 75.v),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: _buildDate(
                        context,
                        date: "Date ",
                        threeThousandThreeHundredTwent: "3/3/21",
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildTime(
                        context,
                        time: "Time",
                        time1: "14 : 17 PM",
                      ),
                    ),
                    SizedBox(height: 11.v),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: _buildAddress(
                        context,
                        address: "Address",
                        abiolaWayAkure: "1, Abiola Way, Akure",
                      ),
                    ),
                    SizedBox(height: 12.v),
                    Padding(
                      padding: EdgeInsets.only(left: 8.h),
                      child: _buildLocation(
                        context,
                        location: "Location",
                        generalHospital: "General Hospital, Barracks",
                      ),
                    ),
                    SizedBox(height: 45.v),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppointmentPageFive(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(
          height: 125.v,
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return AppointmentpagefiveItemWidget();
      },
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
