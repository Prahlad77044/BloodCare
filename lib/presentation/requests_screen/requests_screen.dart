import '../requests_screen/widgets/requests_item_widget.dart';
import 'package:bdc/core/app_export.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Pending Requests'),
              backgroundColor: Colors.red[800],
              elevation: 0
              ,
            ),

            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 16.v),
                    child: Column(children: [
                      _buildRequests(context),

                    ])))));
  }


  }

  /// Section Widget
  Widget _buildRequests(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 6.v);
        },
        itemCount: 4,
        itemBuilder: (context, index) {
          return RequestsItemWidget();
        });
  }


