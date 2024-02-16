import 'dart:convert';

import 'package:bdc/core/app_export.dart';
import 'package:bdc/widgets/custom_elevated_button.dart';
import 'package:bdc/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RequestsItemWidget extends StatefulWidget {
  const RequestsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  State<RequestsItemWidget> createState() => _RequestsItemWidgetState();
}

class _RequestsItemWidgetState extends State<RequestsItemWidget> {
  Future<List<dynamic>> getRequest() async {
    String url = "http://192.168.1.2:4444/api/blood-req_lst/";
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // if responseData is a Map, wrap it in a list
        if (responseData is Map) {
          return [responseData];
        } else {
          return responseData;
        }
      } else {
        print('The response is not JSON.');
        return []; // return an empty list if the response is not JSON
      }
    } catch (e) {
      print('Caught error: $e');
      return []; // return an empty list if an error occurs
    }
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: getRequest(),
    //     builder: (context, snapshot) {
    //       if (snapshot.data == null) {
    //         return Container(
    //           child: Center(
    //             child: CircularProgressIndicator.adaptive(),
    //           ),
    //         );
    //       }
    //       final data = snapshot.data as List;
    //       var name = data[0]['name'];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 7.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 7.v,
                  bottom: 1.v,
                ),
                child: Text(
                  "Name",
                  style: CustomTextStyles.bodySmallGray500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.h),
                child: Text(
                  "Dr.Will Tunde",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 13.v),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 1.v,
                  bottom: 2.v,
                ),
                child: Text(
                  "Location",
                  style: CustomTextStyles.bodySmallGray500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "General Hospital, Barracks",
                  style: CustomTextStyles.bodySmallGray800_1,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.v),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 1.v,
                  bottom: 2.v,
                ),
                child: Text(
                  "Address",
                  style: CustomTextStyles.bodySmallGray500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "1, Abiola Way, Akure",
                  style: CustomTextStyles.bodySmallGray800_1,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 2.v,
                  bottom: 1.v,
                ),
                child: Text(
                  "Date ",
                  style: CustomTextStyles.bodySmallGray500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 22.h),
                child: Text(
                  "3/3/21",
                  style: CustomTextStyles.bodySmallGray800_1,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    height: 38.v,
                    text: "Accept",
                    margin: EdgeInsets.only(right: 19.h),
                  ),
                ),
                Expanded(
                  child: CustomOutlinedButton(
                    height: 38.v,
                    text: "Reject",
                    margin: EdgeInsets.only(left: 19.h),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
