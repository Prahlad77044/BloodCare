import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class RequestsRejectedDialog extends StatelessWidget {
  const RequestsRejectedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: 282.h,
        padding: EdgeInsets.symmetric(horizontal: 81.h, vertical: 34.v),
        decoration: AppDecoration.fillOnPrimary,
        child: Column(children: [
          SizedBox(
              height: 115.v,
              width: 119.h,
              child: Stack(alignment: Alignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgClose,
                    height: 50.adaptSize,
                    width: 50.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgClose(context);
                    }),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: 115.v,
                        width: 119.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(59.h),
                            border: Border.all(
                                color: theme.colorScheme.primary,
                                width: 10.h))))
              ])),
          SizedBox(height: 20.v),
          Text(" Rejected", style: CustomTextStyles.titleMediumBluegray900),
          SizedBox(height: 16.v)
        ]));
  }

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }
}
