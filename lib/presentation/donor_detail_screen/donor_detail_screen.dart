import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_checkbox_button.dart';
import 'package:bdc/widgets/custom_drop_down.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DonorDetailScreen extends StatefulWidget {
  DonorDetailScreen({Key? key}) : super(key: key);

  @override
  State<DonorDetailScreen> createState() => _DonorDetailScreenState();
}

class _DonorDetailScreenState extends State<DonorDetailScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController provinceNumberController = TextEditingController();

  TextEditingController districtController = TextEditingController();

  List<String> dropdownItemList = ["Province No. 1", "Madhesh Pradesh", "Bagmati Pradesh","Gandaki Pradesh","Lumbini Pradesh","Karnali Pradesh","Sudurpaschim Pradesh"];

  TextEditingController cityController = TextEditingController();

  List<String> dropdownItemList1=["Achham", "Arghakhanchi", "Baglung", "Baitadi", "Bajhang", "Bajura", "Banke", "Bara", "Bardiya", "Bhaktapur", "Bhojpur", "Chitwan", "Dadeldhura", "Dailekh", "Dang", "Darchula", "Dhading", "Dhankuta", "Dhanusha", "Dolkha", "Dolpa", "Doti", "Gorkha", "Gulmi", "Humla", "Ilam", "Jajarkot", "Jhapa", "Jumla", "Kailali", "Kalikot", "Kanchanpur", "Kapilvastu", "Kaski", "Kathmandu", "Kavrepalanchok", "Khotang", "Lalitpur", "Lamjung", "Mahottari", "Makwanpur", "Manang", "Morang", "Mugu", "Mustang", "Myagdi", "Nawalparasi East", "Nawalparasi West", "Nuwakot", "Okhaldhunga", "Palpa", "Panchthar", "Parbat", "Parsa", "Pyuthan", "Ramechhap", "Rasuwa", "Rautahat", "Rolpa", "Rukum (Eastern)", "Rukum (Western)", "Rupandehi", "Salyan", "Sankhuwasabha", "Saptari", "Sarlahi", "Sindhuli", "Sindhupalchok", "Siraha", "Solukhumbu", "Sunsari", "Surkhet", "Syangja", "Tanahun", "Taplejung", "Terhathum", "Udayapur"];

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  bool bySubmittingtheformIherebydecl = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('Details'),
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 22.h, right: 15.h, bottom: 50.v),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 11.h,top: 10),
                                  child: Text("Please enter your full detail",
                                      style:
                                          CustomTextStyles.bodyMediumGray900))),
                          SizedBox(height: 17.v),
                          _buildName(context),
                          SizedBox(height: 17.v),
                          _buildProvinceNumber(context),
                          SizedBox(height: 17.v),
                          _buildDistrict(context),
                          SizedBox(height: 17.v),
                          _buildCity(context),
                          SizedBox(height: 17.v),
                          _buildDateOfBirth(context),
                          SizedBox(height: 17.v),
                          _buildEmail(context),
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

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
        controller: nameController,
        textInputType: TextInputType.name,
        hintText: "Name",
        );
  }

  /// Section Widget
  Widget _buildProvinceNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 2.h, right: 4.h),
        child: CustomDropDown(
            autofocus: false,
            hintText: "Province",
            items: dropdownItemList,
            onChanged: (value) {}));
  }

  /// Section Widget
  Widget _buildDistrict(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(
            left: 2.h, right: 4.h),
        child: CustomDropDown(
            hintText: "District",
            autofocus: false,
            items: dropdownItemList1,
            onChanged: (value) {}));
  }

  /// Section Widget

  /// Section Widget
  Widget _buildCity(BuildContext context) {
    return CustomTextFormField(

        controller: cityController,
        hintText: "City",
        hintStyle: CustomTextStyles.bodySmallGray500_1,
        );
  }



  /// Section Widget
  Widget _buildDateOfBirth(BuildContext context) {
    return CustomTextFormField(
        controller: dateOfBirthController,
        hintText: "Date of Birth (YY-MM-DD)",
        textInputType: TextInputType.datetime,
        hintStyle: CustomTextStyles.bodySmallGray500_1,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 13.v));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "Email",
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildGender(BuildContext context) {
    return CustomTextFormField(
        controller: genderController,
        hintText: "Gender",

        contentPadding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 13.v));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return CustomTextFormField(
        controller: phoneNumberController,
        hintText: "Phone Number",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.phone);
  }

  /// Section Widget
  Widget _buildBySubmittingtheformIherebydecl(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.h),
        child: CustomCheckboxButton(
            text:
                "By Submitting the form I hereby declare that I am 18 or above years old and wish to donate blood when needed.",
            isExpandedText: true,

            value: bySubmittingtheformIherebydecl,
            onChange: (value) {
             setState(() {
               bySubmittingtheformIherebydecl =value ;
             });
            }));
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
        text: "Submit",
        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
        buttonTextStyle: CustomTextStyles.titleSmallOnPrimary_1);
  }
}
