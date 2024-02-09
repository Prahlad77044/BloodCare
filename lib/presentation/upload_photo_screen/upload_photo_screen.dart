import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({Key? key})
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
          padding: EdgeInsets.symmetric(
            horizontal: 44.h,
            vertical: 58.v,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 81.h),
                  child: Text(
                    "Uploading",
                    style: CustomTextStyles.titleLargePrimary,
                  ),
                ),
              ),
              SizedBox(height: 77.v),
              CustomImageView(
                imagePath: ImageConstant.imgWhiteCloudWith,
                height: 277.v,
                width: 287.h,
              ),
              SizedBox(height: 61.v),
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
