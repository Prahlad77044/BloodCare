import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DocRequestBottomsheet extends StatelessWidget {
  const DocRequestBottomsheet({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 35,),
          Stack(
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
          SizedBox(height: 5,),

          Text(
            "Request Sent",
            style: CustomTextStyles.titleLargeBluegray900,
          ),
          SizedBox(height: 52.v),
        ],
      ),
    );
  }
}
