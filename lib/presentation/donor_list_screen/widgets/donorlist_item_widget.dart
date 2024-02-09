import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DonorlistItemWidget extends StatelessWidget {
  const DonorlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.h),
      decoration: AppDecoration.outlineBlack900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Ram poudel",
                  style: CustomTextStyles.titleSmallPink900,
                ),
              ),
              SizedBox(height: 1.v),
              Container(
                width: 110.h,
                margin: EdgeInsets.only(left: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.v),
                      child: Text(
                        "Male",
                        style: CustomTextStyles.bodySmall10,
                      ),
                    ),
                    SizedBox(
                      height: 21.v,
                      width: 45.h,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Blood Group",
                              style: CustomTextStyles.montserratOnPrimary,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "AB-",
                              style: CustomTextStyles.bodySmall10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.v),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Address",
                  style: CustomTextStyles.montserratOnPrimary,
                ),
              ),
              Text(
                "Teku, Kathmandu",
                style: CustomTextStyles.bodySmall8,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 18.v,
              bottom: 21.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact",
                  style: CustomTextStyles.montserratOnPrimary,
                ),
                Text(
                  "+23481098327",
                  style: CustomTextStyles.bodySmall10,
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            height: 34.v,
            width: 98.h,
            text: "Request",
            margin: EdgeInsets.only(
              left: 12.h,
              top: 8.v,
              bottom: 19.v,
            ),
          ),
        ],
      ),
    );
  }
}
