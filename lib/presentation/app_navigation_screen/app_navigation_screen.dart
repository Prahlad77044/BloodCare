import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "welcome screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Upload photo",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.uploadPhotoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Upload photo Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.uploadPhotoTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "blood type select",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bloodTypeSelectScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Upload document",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.uploadDocumentScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Upload document Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.uploadDocumentTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "sign Up",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Contact donor",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.contactDonorScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Appointment Page Three - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.appointmentPageThreeTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Log In",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.logInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "1st step of new password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.stStepOfNewPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "new password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.newPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "donor list",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.donorListScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "doc request One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.docRequestOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "home page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homePageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Rewards",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.rewardsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "blood type select One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bloodTypeSelectOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "donor detail",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.donorDetailScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Upload profile photo Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.uploadProfilePhotoTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Upload profile photo ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.uploadProfilePhotoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "requests",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.requestsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "doc home page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.docHomePageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "History",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.historyScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
