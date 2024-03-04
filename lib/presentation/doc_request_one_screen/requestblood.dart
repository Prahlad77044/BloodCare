import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_drop_down.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore_for_file: must_be_immutable
class DocRequestOneScreen extends StatefulWidget {
  DocRequestOneScreen({Key? key}) : super(key: key);

  @override
  State<DocRequestOneScreen> createState() => _DocRequestOneScreenState();
}

class _DocRequestOneScreenState extends State<DocRequestOneScreen> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  var prov;

  var bloodgrp;

  var district;

  Future RequestdetailsSubmit() async {
    var url = 'http://192.168.1.4:4444/bloodcare/requests/';
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    print('button pressed');
    print('$accessToken');
    print('$bloodgrp');
    print('$district');
    print('$prov');
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'pat_name': nameController.text.toString(),
        'contact_person': contactPersonController.text.toString(),
        'phoneno': phoneNumberController.text.toString(),
        'hospital': hospitalController.text.toString(),
        'prov_no': prov.toString(),
        'bloodgroup': bloodgrp.toString(),
        'reqpint': requiredPintController.text.toString(),
        'district': district.toString(),
        'req_date': dateController.text.toString(),
        'case_details': caseDetailsController.text.toString()
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      Navigator.pushNamed(context, '/suc_req_screen');

      // Navigator.pushNamed(context as BuildContext, '/home_page_screen');
      return ("${response.statusCode}");
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Unsuccessful'),
            content: Text('Unsuccessful Post.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      print("${response.body}");
    }

    return response.body;
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController contactPersonController = TextEditingController();

  List<String> dropdownItemList = ["1", "2", "3", "4", "5", "6", "7"];

  TextEditingController districtController = TextEditingController();

  List<String> dropdownItemList1 = [
    "Achham",
    "Arghakhanchi",
    "Baglung",
    "Baitadi",
    "Bajhang",
    "Bajura",
    "Banke",
    "Bara",
    "Bardiya",
    "Bhaktapur",
    "Bhojpur",
    "Chitwan",
    "Dadeldhura",
    "Dailekh",
    "Dang",
    "Darchula",
    "Dhading",
    "Dhankuta",
    "Dhanusha",
    "Dolkha",
    "Dolpa",
    "Doti",
    "Gorkha",
    "Gulmi",
    "Humla",
    "Ilam",
    "Jajarkot",
    "Jhapa",
    "Jumla",
    "Kailali",
    "Kalikot",
    "Kanchanpur",
    "Kapilvastu",
    "Kaski",
    "Kathmandu",
    "Kavrepalanchok",
    "Khotang",
    "Lalitpur",
    "Lamjung",
    "Mahottari",
    "Makwanpur",
    "Manang",
    "Morang",
    "Mugu",
    "Mustang",
    "Myagdi",
    "Nawalparasi East",
    "Nawalparasi West",
    "Nuwakot",
    "Okhaldhunga",
    "Palpa",
    "Panchthar",
    "Parbat",
    "Parsa",
    "Pyuthan",
    "Ramechhap",
    "Rasuwa",
    "Rautahat",
    "Rolpa",
    "Rukum (Eastern)",
    "Rukum (Western)",
    "Rupandehi",
    "Salyan",
    "Sankhuwasabha",
    "Saptari",
    "Sarlahi",
    "Sindhuli",
    "Sindhupalchok",
    "Siraha",
    "Solukhumbu",
    "Sunsari",
    "Surkhet",
    "Syangja",
    "Tanahun",
    "Taplejung",
    "Terhathum",
    "Udayapur"
  ];

  List<String> dropdownItemList2 = [
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];

  TextEditingController hospitalController = TextEditingController();

  TextEditingController requiredPintController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController caseDetailsController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.red[800],
              title: Text('Request for Blood',
                  style: TextStyle(color: Colors.white)),
            ),
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                      child: SizedBox(
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primary))),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 17.h, vertical: 29.v),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildName(context),
                                      SizedBox(height: 19.v),
                                      _buildContactPerson(context),
                                      SizedBox(height: 19.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.h, right: 4.h),
                                          child: CustomDropDown(
                                            autofocus: false,
                                            icon: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30.h,
                                                    vertical: 16.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgArrowDown,
                                                    height: 9.v,
                                                    width: 18.h)),
                                            hintText: "Blood Group",
                                            items: dropdownItemList2,
                                            onChanged: (value) {
                                              bloodgrp = value;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select a blood group';
                                              } else
                                                return null;
                                            },
                                          )),
                                      SizedBox(height: 19.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.h, right: 4.h),
                                          child: CustomDropDown(
                                            autofocus: false,
                                            icon: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30.h,
                                                    vertical: 16.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgArrowDown,
                                                    height: 9.v,
                                                    width: 18.h)),
                                            hintText: "Province",
                                            items: dropdownItemList,
                                            onChanged: (value) {
                                              prov = value;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select a province';
                                              }
                                              return null;
                                            },
                                          )),
                                      SizedBox(height: 19.v),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5.h, right: 4.h),
                                          child: CustomDropDown(
                                            autofocus: false,
                                            icon: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 30.h,
                                                    vertical: 16.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgArrowDown,
                                                    height: 9.v,
                                                    width: 18.h)),
                                            hintText: "District",
                                            items: dropdownItemList1,
                                            onChanged: (value) {
                                              district = value;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please select a district';
                                              }
                                              return null;
                                            },
                                          )),
                                      SizedBox(height: 17.v),
                                      _buildHospital(context),
                                      SizedBox(height: 17.v),
                                      _buildRequiredPint(context),
                                      SizedBox(height: 20.v),
                                      _buildPhoneNumber(context),
                                      SizedBox(height: 14.v),
                                      _buildDate(context),
                                      SizedBox(height: 20.v),
                                      _buildCaseDetails(context),
                                      SizedBox(height: 25.v),
                                      _buildRequest(context),
                                      SizedBox(height: 13.v)
                                    ])))
                      ])))),
            )));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 4.h),
        child: CustomTextFormField(
            controller: nameController, hintText: "Patient Name"));
  }

  /// Section Widget
  Widget _buildContactPerson(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 4.h),
        child: CustomTextFormField(
            controller: contactPersonController, hintText: "Contact Person"));
  }

  /// Section Widget
  Widget _buildHospital(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h, right: 1.h),
        child: CustomTextFormField(
            controller: hospitalController, hintText: "Hospital"));
  }

  /// Section Widget
  Widget _buildRequiredPint(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 4.h),
        child: CustomTextFormField(
            controller: requiredPintController, hintText: "Required Pint"));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 4.h),
        child: CustomTextFormField(
            controller: phoneNumberController,
            hintText: "Phone Number",
            textInputType: TextInputType.phone));
  }

  /// Section Widget
  Widget _buildDate(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h, right: 4.h),
        child: CustomTextFormField(
          controller: dateController,
          hintText: "Required Date",
          textInputType: TextInputType.datetime,
        ));
  }

  /// Section Widget
  Widget _buildCaseDetails(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 4.h),
        child: CustomTextFormField(
            controller: caseDetailsController,
            hintText: "Case Details",
            textInputAction: TextInputAction.done));
  }

  /// Section Widget
  Widget _buildRequest(BuildContext context) {
    return CustomElevatedButton(
        text: "Request",
        margin: EdgeInsets.only(left: 10.h),
        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1,
        onPressed: () {
          RequestdetailsSubmit();
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
