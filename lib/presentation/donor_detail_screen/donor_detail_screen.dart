import 'dart:convert';
import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_checkbox_button.dart';
import 'package:bdc/widgets/custom_drop_down.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class DonorDetailScreen extends StatefulWidget {
  var latitude;
  var longitude;
  DonorDetailScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<DonorDetailScreen> createState() => _DonorDetailScreenState();
}

class _DonorDetailScreenState extends State<DonorDetailScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController provinceNumberController = TextEditingController();

  TextEditingController districtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with provided latitude and longitude values
    latController.text = widget.latitude ??
        ''; // Provide default empty string if latitude is null
    longController.text = widget.longitude ??
        ''; // Provide default empty string if longitude is null
  }

  List<String> dropdownItemList = ["1", "2", "3", "4", "5", "6", "7"];

  TextEditingController cityController = TextEditingController();

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
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future detailsSubmit() async {
    var url = 'http://192.168.159.163:4444/bloodcare/donors/';
    String? accessToken = await secureStorage.read(key: 'access_token');
    String? refreshToken = await secureStorage.read(key: 'refresh_token');
    print('button pressed');
    print('$accessToken');
    print('$bloodgrp');
    print('$district');
    print('$prov');
    print('$bySubmittingtheformIherebydecl');
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'name': nameController.text.toString(),
        'phoneno': phoneNumberController.text.toString(),
        'confirm': bySubmittingtheformIherebydecl.toString(),
        'prov_no': prov.toString(),
        'bloodgrp': bloodgrp.toString(),
        'city': cityController.text.toString(),
        'district': district.toString(),
        'dob': dateOfBirthController.text.toString(),
        'gender': genderController.text.toString(),
        'lattitude': latController.text.toString(),
        'longitude': longController.text.toString()
      }),
    );
    if (response.statusCode == 201) {
      print('post successful');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Successful'),
            content: Text('Your details has been posted successfully'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home_page_screen');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print('${response.statusCode}');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Unsuccessful'),
            content: Text('Please try again'),
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
    }
    print("${response.body}");
    return response.body;
  }

  var bloodgrp;
  var prov;
  var district;
  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController latController = TextEditingController();

  TextEditingController longController = TextEditingController();

  bool bySubmittingtheformIherebydecl = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(
                'Details',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red[800],
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            EdgeInsets.only(left: 22, right: 15, bottom: 50),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 11.h, top: 13),
                                  child: Text("Please enter your full detail",
                                      style:
                                          CustomTextStyles.bodyMediumGray900))),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/latlong');
                              },
                              child: Text(
                                "To find your current location's latitude and longitude,click here.",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red[800],
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w100),
                              )),
                          _buildLatitude(context),
                          SizedBox(height: 17.v),
                          _buildLongitude(context),
                          SizedBox(height: 17.v),
                          _buildName(context),
                          SizedBox(height: 17.v),
                          _buildProvinceNumber(context),
                          SizedBox(height: 17.v),
                          _buildDistrict(context),
                          SizedBox(height: 17.v),
                          _buildCity(context),
                          SizedBox(height: 17.v),
                          Padding(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              child: CustomDropDown(
                                autofocus: false,
                                icon: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30.h, vertical: 16.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgArrowDown,
                                        height: 9.v,
                                        width: 18.h)),
                                hintText: "Blood Group",
                                items: dropdownItemList2,
                                onChanged: (value) {
                                  bloodgrp = value;
                                },
                              )),
                          SizedBox(
                            height: 17,
                          ),
                          _buildDateOfBirth(context),
                          SizedBox(height: 17.v),
                          _buildGender(context),
                          SizedBox(height: 17.v),
                          _buildPhoneNumber(context),
                          SizedBox(height: 33.v),
                          _buildBySubmittingtheformIherebydecl(context),
                          SizedBox(height: 8.v),
                          _buildSubmit(context)
                        ]))))));
  }

  Widget _buildLatitude(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
          textInputType: TextInputType.number,
          controller: latController,
          hintText: "Latitude(Optional)",
        ));
  }

  Widget _buildLongitude(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            textInputType: TextInputType.number,
            controller: longController,
            hintText: "Longitude(Optional)"));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: CustomTextFormField(
        contentPadding: EdgeInsets.all(14),
        controller: nameController,
        textInputType: TextInputType.name,
        hintText: "Name",
      ),
    );
  }

  /// Section Widget
  Widget _buildProvinceNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: CustomDropDown(
          contentPadding: EdgeInsets.all(12),
          autofocus: false,
          hintText: "Province",
          items: dropdownItemList,
          onChanged: (value) {
            prov = value;
          },
        ));
  }

  /// Section Widget
  Widget _buildDistrict(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 2, right: 2),
        child: CustomDropDown(
            contentPadding: EdgeInsets.all(12),
            hintText: "District",
            textStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            autofocus: false,
            items: dropdownItemList1,
            onChanged: (value) {
              district = value;
            }));
  }

  /// Section Widget
  Widget _buildCity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: CustomTextFormField(
        contentPadding: EdgeInsets.all(14),
        controller: cityController,
        hintText: "City",
        hintStyle: CustomTextStyles.bodySmallGray500_1,
      ),
    );
  }

  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: CustomTextFormField(
          controller: dateOfBirthController,
          hintText: "Date of Birth (YY-MM-DD)",
          textInputType: TextInputType.datetime,
          hintStyle: CustomTextStyles.bodySmallGray500_1,
          contentPadding: EdgeInsets.all(14)),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: CustomTextFormField(
          contentPadding: EdgeInsets.all(14),
          controller: emailController,
          hintText: "Email",
          textInputType: TextInputType.emailAddress),
    );
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: CustomTextFormField(
          controller: genderController,
          hintText: "Gender",
          contentPadding: EdgeInsets.all(14)),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: CustomTextFormField(
          contentPadding: EdgeInsets.all(14),
          controller: phoneNumberController,
          hintText: "Phone Number",
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.phone),
    );
  }

  /// Section Widget
  Widget _buildBySubmittingtheformIherebydecl(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.h),
        child: CustomCheckboxButton(
            text:
                "By submitting the form, I hereby declare that I am 18 years or above, I am in good health, and I wish to donate blood when needed.",
            isExpandedText: true,
            value: bySubmittingtheformIherebydecl,
            onChange: (value) {
              setState(() {
                bySubmittingtheformIherebydecl = value;
              });
            }));
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
        onPressed: detailsSubmit,
        text: "Submit",
        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1);
  }
}
