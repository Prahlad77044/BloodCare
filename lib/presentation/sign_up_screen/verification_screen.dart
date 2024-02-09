import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';


class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);
  final TextEditingController ourcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Container(
                    width: double.maxFinite,
                    padding:
                    EdgeInsets.symmetric(horizontal: 38.h, vertical: 51.v),
                    decoration: AppDecoration.fillOnPrimary,
                    child: Column(children: [
                      SizedBox(height: 40,),
                      Image.asset('assets/images/lock.png',
                      height: 150,),
                      
                      Text("Verification",
                        style: CustomTextStyles.headlineSmallPrimary,
                      ),
                      SizedBox(height: 20),
                      Container(
                          width: 242.h,
                          margin: EdgeInsets.only(left: 35.h, right: 21.h),
                          child: Text(
                              "Please enter the verification code sent to +977*********",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.titleMediumBlack900)),
                      SizedBox(height: 15.v),
                      Padding(
                        padding:  EdgeInsets.only(left: 20.0,right: 20),
                        child: TextField(
                          keyboardType:TextInputType.number ,
                          maxLength: 4,
                          controller: ourcontroller,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2
                                )
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 11.v),
                      Text("Didn't recieve the code. ",),
                      SizedBox(height: 5,),
                      Text('Resend Code',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        color: Colors.red[800],
                        fontWeight: FontWeight.w400
                      ),),
                      SizedBox(height: 20,),
                      CustomElevatedButton(
                          text: "Verify",
                          margin: EdgeInsets.only(left: 11.h),
                          buttonStyle:
                          CustomButtonStyles.fillSecondaryContainer,
                          buttonTextStyle:
                          CustomTextStyles.titleSmallRobotoOnPrimary_1,
                          onPressed: () {
                            onTapContinue(context);
                          }),

                    ])))));
  }

  /// Navigates to the newPasswordScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, '/verified');
  }
}
