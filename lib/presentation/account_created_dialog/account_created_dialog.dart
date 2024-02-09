import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class AccountCreatedDialog extends StatelessWidget {
  const AccountCreatedDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: 288.h,
      padding: EdgeInsets.symmetric(
        horizontal: 74.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillOnPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 34.v),
          Container(
            height: 115.v,
            width: 119.h,
            margin: EdgeInsets.only(left: 6.h),
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
                        width: 5.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 26.v),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 128.h,
              margin: EdgeInsets.only(left: 10.h),
              child: Text(
                "Account  created        successfully",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleLargeBluegray900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
