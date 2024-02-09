import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class UploadProfilePhotoScreen extends StatelessWidget {
  const UploadProfilePhotoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 88.v),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 143.h),
                  child: Text(
                    "Uploading",
                    style: CustomTextStyles.titleLargePrimary,
                  ),
                ),
              ),
              SizedBox(height: 74.v),
              CustomImageView(
                imagePath: ImageConstant.imgVectorPrimary,
                height: 103.v,
                width: 92.h,
              ),
              SizedBox(height: 42.v),
              Text(
                ".   .   .",
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 36.v),
              Text(
                "Your image is being uploaded",
                style: CustomTextStyles.titleSmallPrimaryMedium,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
