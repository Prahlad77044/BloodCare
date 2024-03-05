import 'package:bdc/presentation/Feedback/customer_support.dart';
import 'package:bdc/presentation/doc_request_one_screen/PendingRequest.dart';
import 'package:bdc/presentation/health_calculator_screen/bmi_calc.dart';
import 'package:bdc/presentation/health_calculator_screen/navigate.dart';
import 'package:bdc/presentation/health_calculator_screen/watervolume.dart';
import 'package:bdc/presentation/requests_screen/reqverified.dart';
import 'package:bdc/presentation/sign_up_screen/latlong.dart';
import 'package:bdc/presentation/sign_up_screen/verification_screen.dart';
import 'package:bdc/presentation/sign_up_screen/verified.dart';
import 'package:bdc/presentation/rewards_screen/navigation.dart';
import 'package:flutter/material.dart';
import 'package:bdc/presentation/welcome_screen/welcome_screen.dart';
import 'package:bdc/presentation/upload_photo_screen/upload_photo_screen.dart';
import 'package:bdc/presentation/upload_photo_two_screen/upload_photo_two_screen.dart';
import 'package:bdc/presentation/upload_document_screen/upload_document_screen.dart';
import 'package:bdc/presentation/upload_document_two_screen/upload_document_two_screen.dart';
import 'package:bdc/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:bdc/presentation/contact_donor_screen/contact_donor_screen.dart';
import 'package:bdc/presentation/appointment_page_three_tab_container_screen/appointment_page_three_tab_container_screen.dart';
import 'package:bdc/presentation/log_in_screen/log_in_screen.dart';
import 'package:bdc/presentation/st_step_of_new_password_screen/st_step_of_new_password_screen.dart';
import 'package:bdc/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:bdc/presentation/new_password_screen/new_password_screen.dart';
import 'package:bdc/presentation/donor_list_screen/donor_list_screen.dart';
import 'package:bdc/presentation/doc_request_one_screen/requestblood.dart';
import 'package:bdc/presentation/home_page_screen/home_page_screen.dart';
import 'package:bdc/presentation/donate_from_home_bottomsheet/optionsdonate.dart';
import 'package:bdc/presentation/rewards_screen/rewards_screen.dart';
import 'package:bdc/presentation/profile_screen/profile_screen.dart';
import 'package:bdc/presentation/donor_detail_screen/donor_detail_screen.dart';
import 'package:bdc/presentation/info_screen/info_screen.dart';
import 'package:bdc/presentation/upload_profile_photo_two_screen/upload_profile_photo_two_screen.dart';
import 'package:bdc/presentation/upload_profile_photo_screen/upload_profile_photo_screen.dart';
import 'package:bdc/presentation/doc_home_page_screen/doc_home_page_screen.dart';
import 'package:bdc/presentation/app_navigation_screen/app_navigation_screen.dart';

import '../presentation/info_screen/plasmadonation.dart';
import '../presentation/maps/map.dart';
import '../presentation/requests_screen/widgets/requests screen.dart';

class AppRoutes {
  static const String donorsNearby = '/donorsNearby';

  static const String latLong = '/latlong';

  static const String plasmaCentre = '/plasma_centre';

  static const String verificationScreen = '/verification_screen';

  static const String verifiedScreen = '/verified';

  static const String bmiCalculator = '/bmi_calc';

  static const String healthCalculatorHome = '/health_calc';

  static const String welcomeScreen = '/welcome_screen';

  static const String uploadPhotoScreen = '/upload_photo_screen';

  static const String uploadPhotoTwoScreen = '/upload_photo_two_screen';

  static const String profileScreen = '/profile_screen';

  static const String bloodTypeSelectScreen = '/blood_type_select_screen';

  static const String uploadDocumentScreen = '/upload_verification';

  static const String uploadDocumentTwoScreen = '/upload_document_two_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const plasmaDonationPage ='/plasma_donation_page';

  static const String contactDonorScreen = '/contact_donor_screen';

  static const String appointmentPageFivePage = '/appointment_page_five_page';

  static const String appointmentPageThreePage = '/appointment_page_three_page';

  static const String waterVolumeCalculator = '/water_volume';

  static const String appointmentPageThreeTabContainerScreen =
      '/appointment_page_three_tab_container_screen';

  static const String logInScreen = '/log_in_screen';

  static const String stStepOfNewPasswordScreen =
      '/st_step_of_new_password_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String donorListScreen = '/donor_list_screen';

  static const String docRequestOneScreen = '/doc_request_one_screen';

  static const String pendingRequest = '/pending_request_screen';

  static const String homePageScreen = '/home_page_screen';

  static const String rewardsScreen = '/rewards_screen';

  static const String bloodTypeSelectOneScreen =
      '/blood_type_select_one_screen';

  static const String donorDetailScreen = '/donor_detail_screen';

  static const String successfulReqVerified = '/suc_req_screen';

  static const String customerSupport = '/customer_support';

  static const String uploadProfilePhotoTwoScreen =
      '/upload_profile_photo_two_screen';

  static const String uploadProfilePhotoScreen = '/upload_profile_photo_screen';

  static const String requestsScreen = '/requests_screen';

  static const String resetPasswordPage = '/reset_screen';

  static const String docHomePageScreen = '/doc_home_page_screen';

  static const String historyScreen = '/history_screen';

  static const String infoScreen = '/info_screen';

  static const String rewardPage = '/reward_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String donateFromHomeBottomsheet =
      '/donate_from_home_bottomsheet.dart';

  static Map<String, WidgetBuilder> routes = {
    healthCalculatorHome: (context) => HealthCalculatorHome(),
    waterVolumeCalculator: (context) => WaterVolumeCalculator(),
    latLong: (context) => LatLong(),
    welcomeScreen: (context) => WelcomeScreen(),
    infoScreen: (context) => InfoScreen(),
    uploadPhotoScreen: (context) => UploadPhotoScreen(),
    uploadPhotoTwoScreen: (context) => UploadPhotoTwoScreen(),
    profileScreen: (context) => ProfileScreen(),
    uploadDocumentScreen: (context) => UploadDocumentScreen(),
    uploadDocumentTwoScreen: (context) => UploadDocumentTwoScreen(),
    pendingRequest: (context) => PendingRequest(),
    signUpScreen: (context) => SignUpScreen(
          latitude: 'Latitude(optional)',
          longitude: 'Longitude(optional)',
        ),
    plasmaDonationPage:(context)=>PlasmaDonationPage(),
    verificationScreen: (context) => VerificationScreen(),
    verifiedScreen: (context) => SuccessfulVerified(),
    bmiCalculator: (context) => BMICalculator(),
    donorsNearby: (context) => DonorsNearby(),
    customerSupport: (context) => CustomerSupport(),
    successfulReqVerified: (context) => SuccessfulReqVerified(),
    contactDonorScreen: (context) => ContactDonorScreen(),
    rewardsScreen: (context) => RewardsScreen(),
    appointmentPageThreeTabContainerScreen: (context) =>
        AppointmentPageThreeTabContainerScreen(),
    logInScreen: (context) => LogInScreen(),
    stStepOfNewPasswordScreen: (context) => StStepOfNewPasswordScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    rewardPage: (context) => RewardPage(),
    newPasswordScreen: (context) => NewPasswordScreen(),
    donorListScreen: (context) => DonorListScreen(),
    docRequestOneScreen: (context) => DocRequestOneScreen(),
    requestsScreen: (context) => RequestsWidget(),
    homePageScreen: (context) => HomePageScreen(),
    donorDetailScreen: (context) =>
        DonorDetailScreen(latitude: null, longitude: null),
    uploadProfilePhotoTwoScreen: (context) => UploadProfilePhotoTwoScreen(),
    uploadProfilePhotoScreen: (context) => UploadProfilePhotoScreen(),
    docHomePageScreen: (context) => DocHomePageScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    donateFromHomeBottomsheet: (context) => DonateFromHomeBottomsheet(),
  };
}
