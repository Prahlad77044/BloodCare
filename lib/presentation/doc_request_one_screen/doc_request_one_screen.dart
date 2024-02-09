import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_drop_down.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:bdc/presentation/doc_request_bottomsheet/doc_request_bottomsheet.dart';

// ignore_for_file: must_be_immutable
class DocRequestOneScreen extends StatelessWidget {
  DocRequestOneScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController contactPersonController = TextEditingController();

  List<String> dropdownItemList = ["Province No. 1", "Madhesh Pradesh", "Bagmati Pradesh","Gandaki Pradesh","Lumbini Pradesh","Karnali Pradesh","Sudurpaschim Pradesh"];

  TextEditingController districtController = TextEditingController();

  List<String> dropdownItemList1=["Achham", "Arghakhanchi", "Baglung", "Baitadi", "Bajhang", "Bajura", "Banke", "Bara", "Bardiya", "Bhaktapur", "Bhojpur", "Chitwan", "Dadeldhura", "Dailekh", "Dang", "Darchula", "Dhading", "Dhankuta", "Dhanusha", "Dolkha", "Dolpa", "Doti", "Gorkha", "Gulmi", "Humla", "Ilam", "Jajarkot", "Jhapa", "Jumla", "Kailali", "Kalikot", "Kanchanpur", "Kapilvastu", "Kaski", "Kathmandu", "Kavrepalanchok", "Khotang", "Lalitpur", "Lamjung", "Mahottari", "Makwanpur", "Manang", "Morang", "Mugu", "Mustang", "Myagdi", "Nawalparasi East", "Nawalparasi West", "Nuwakot", "Okhaldhunga", "Palpa", "Panchthar", "Parbat", "Parsa", "Pyuthan", "Ramechhap", "Rasuwa", "Rautahat", "Rolpa", "Rukum (Eastern)", "Rukum (Western)", "Rupandehi", "Salyan", "Sankhuwasabha", "Saptari", "Sarlahi", "Sindhuli", "Sindhupalchok", "Siraha", "Solukhumbu", "Sunsari", "Surkhet", "Syangja", "Tanahun", "Taplejung", "Terhathum", "Udayapur"];

  List<String> dropdownItemList2=["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];

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
              title: Text('Request for Blood'),
            ),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: SizedBox(

                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
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
                                                    margin:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 30.h,
                                                        vertical: 16.v),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgArrowDown,
                                                        height: 9.v,
                                                        width: 18.h)),
                                                hintText: "Blood Group",
                                                items: dropdownItemList2,
                                                onChanged: (value) {})),
                                        SizedBox(height: 19.v),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.h, right: 4.h),
                                            child: CustomDropDown(
                                              autofocus: false,
                                                icon: Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30.h,
                                                            vertical: 16.v),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgArrowDown,
                                                        height: 9.v,
                                                        width: 18.h)),
                                                hintText: "Province",
                                                items: dropdownItemList,
                                                onChanged: (value) {})),
                                        SizedBox(height: 19.v),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.h, right: 4.h),
                                            child: CustomDropDown(
                                              autofocus: false,
                                                icon: Container(
                                                    margin:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 30.h,
                                                        vertical: 16.v),
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgArrowDown,
                                                        height: 9.v,
                                                        width: 18.h)),
                                                hintText: "District",
                                                items: dropdownItemList1,
                                                onChanged: (value) {})),
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
                        ]))))));
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
            controller: dateController, hintText: "Required Date",
        textInputType: TextInputType.datetime,));
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
          onTapRequest(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Shows a modal bottom sheet with [DocRequestBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  onTapRequest(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => DocRequestBottomsheet(),
        isScrollControlled: true);
  }
}
