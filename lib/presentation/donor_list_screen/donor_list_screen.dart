import '../donor_list_screen/widgets/donorlist_item_widget.dart';
import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class DonorListScreen extends StatelessWidget {
  const DonorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            appBar: AppBar(
              title: Text('Donor\'s List'),
              backgroundColor: Colors.red[800],
            ),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 23.v),
                decoration: AppDecoration.fillOnPrimary,
                child: Column(children: [
                  Text("Select from the list of donors to request",
                      style: CustomTextStyles.labelLargePrimary),
                  SizedBox(height: 15.v),
                  _buildDonorList(context)
                ]))));
  }


  /// Section Widget
  Widget _buildDonorList(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 7.v);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return DonorlistItemWidget();
                })));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
