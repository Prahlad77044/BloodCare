import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class DocHomePageScreen extends StatelessWidget {
  const DocHomePageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: mediaQueryData.size.height,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 17.h,
                        top: 9.v,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.h,
                        vertical: 151.v,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 364.v),
                            padding: EdgeInsets.symmetric(
                              horizontal: 29.h,
                              vertical: 25.v,
                            ),
                            decoration: AppDecoration.outlineBlack900.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 4.v),
                                CustomImageView(
                                  imagePath: ImageConstant.imgMessenger1,
                                  height: 30.adaptSize,
                                  width: 30.adaptSize,
                                ),
                                SizedBox(height: 25.v),
                                SizedBox(
                                  width: 67.h,
                                  child: Text(
                                    "Message a\nDonor",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.bodyMediumBlack900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 364.v,
                              right: 16.h,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 37.h,
                              vertical: 18.v,
                            ),
                            decoration: AppDecoration.outlineBlack900.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgToDoList1,
                                  height: 42.adaptSize,
                                  width: 42.adaptSize,
                                  margin: EdgeInsets.only(left: 3.h),
                                ),
                                SizedBox(height: 23.v),
                                Container(
                                  width: 50.h,
                                  margin: EdgeInsets.only(left: 2.h),
                                  child: Text(
                                    "Donor’s\nList",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyles.bodyMediumBlack900,
                                  ),
                                ),
                                SizedBox(height: 11.v),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 467.v,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgEllipse24467x375,
                            height: 467.v,
                            width: 375.h,
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 269.v,
                              width: 256.h,
                              margin: EdgeInsets.only(top: 39.v),
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  CustomImageView(
                                    imagePath:
                                        ImageConstant.imgFreepikCharacter,
                                    height: 211.v,
                                    width: 96.h,
                                    alignment: Alignment.bottomRight,
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant
                                        .imgFreepikCharacterOnprimarycontainer,
                                    height: 260.v,
                                    width: 190.h,
                                    alignment: Alignment.topLeft,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 32.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 23.h,
                        vertical: 31.v,
                      ),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgCall,
                            height: 34.adaptSize,
                            width: 34.adaptSize,
                          ),
                          SizedBox(height: 28.v),
                          Text(
                            "Call a Donor",
                            style: CustomTextStyles.bodyMediumBlack900,
                          ),
                          SizedBox(height: 4.v),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 32.h),
                      padding: EdgeInsets.all(26.h),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 4.v),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgSearch,
                                height: 18.v,
                                width: 13.h,
                                margin: EdgeInsets.only(top: 16.v),
                              ),
                              Container(
                                height: 25.v,
                                width: 21.h,
                                margin: EdgeInsets.only(bottom: 9.v),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 7.h,
                                          top: 5.v,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgVector,
                                              height: 8.v,
                                              width: 6.h,
                                              alignment: Alignment.center,
                                            ),
                                            SizedBox(height: 2.v),
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgVectorPrimary1x3,
                                              height: 1.v,
                                              width: 3.h,
                                              alignment: Alignment.centerRight,
                                              margin:
                                                  EdgeInsets.only(right: 1.h),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgTelevision,
                                      height: 25.v,
                                      width: 21.h,
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 21.v),
                          SizedBox(
                            width: 75.h,
                            child: Text(
                              "Request for \na donation",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyMediumBlack900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
