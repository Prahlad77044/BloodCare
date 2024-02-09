import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppointmentpagefiveItemWidget extends StatelessWidget {
  const AppointmentpagefiveItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomElevatedButton(
            height: 38.v,
            text: "Reschedule",
            margin: EdgeInsets.only(right: 19.h),
          ),
        ),
        Expanded(
          child: CustomOutlinedButton(
            height: 38.v,
            text: "Delete",
            margin: EdgeInsets.only(left: 19.h),
          ),
        ),
      ],
    );
  }
}
