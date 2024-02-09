import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CompatibilityChartBottomsheet extends StatelessWidget {
  const CompatibilityChartBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(20),
            child: Text('Blood Compatibility Chart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),),
            decoration: BoxDecoration(
              color: Colors.red[800],

            ),
          ),
        )
        ,
      Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 3.h,
            vertical: 104.v,
          ),
          decoration: AppDecoration.fillOnPrimary,
          child: CustomImageView(
            imagePath: ImageConstant.imgCapture1,
            height: 369.v,
            width: 366.h,
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
