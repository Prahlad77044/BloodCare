import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AppointmentPageFourDialog extends StatelessWidget {
  const AppointmentPageFourDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 282.h,
      padding: EdgeInsets.all(32.h),
      decoration: AppDecoration.fillOnPrimary,
      child: Column(
        children: [
          SizedBox(
            height: 115.v,
            width: 119.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCheckmark,
                  height: 35.v,
                  width: 56.h,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 115.v,
                    width: 119.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        59.h,
                      ),
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 10.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 27.v),
          Text(
            "Reschedule Successful",
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          SizedBox(height: 13.v),
        ],
      ),
    );
  }
}
