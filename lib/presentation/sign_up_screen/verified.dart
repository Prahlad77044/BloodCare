import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SuccessfulVerified extends StatelessWidget {
  const SuccessfulVerified({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: AppDecoration.fillOnPrimary,
        child: Column(
          children: [
            SizedBox(height: 313.v),
            Center(
              child: Container(
                height: 115.v,
                width: 119.h,
                margin: EdgeInsets.only(left: 6.h),
                child: Center(
                  child: Stack(
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
              ),
            ),
            SizedBox(height: 16.v),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 39.0),
                child: Center(
                  child: Text(
                    "Your Account has been created successfully. ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 50),
              child: GestureDetector(
                onTap: (() {
                  Navigator.pushNamed(context, '/log_in_screen');
                }),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        size: 50,
                        Icons.arrow_back,
                        color: Colors.red[800],
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red[800],
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
